#!/bin/bash
# Run the behaviour evals in evals/cases.json against the skill.
#
#   scripts/run-evals.sh [--skill FILE] [--out DIR] [--only ID]
#
# Each case runs as a real conversation via `claude -p`, with the skill appended to the
# system prompt (the same way claude.ai Project instructions work). Scripted checks run on
# each turn; cases with a "judge" rubric are graded by a second model call.
#
# Env: MODEL (default sonnet), JUDGE_MODEL (default sonnet), REPS (default 1), PARALLEL (default 4)
# Needs: claude (logged in), jq. Costs real usage — run before a release, not on every change.
# --setting-sources project keeps your own plugins, hooks, and CLAUDE.md out of the runs, so the
# model sees only the skill — the same as a fresh claude.ai user.
# Read the transcripts, not just the summary: scripted checks are approximate.
set -euo pipefail

ROOT=$(cd "$(dirname "$0")/.." && pwd)
CASES="$ROOT/evals/cases.json"
MODEL=${MODEL:-sonnet}
JUDGE_MODEL=${JUDGE_MODEL:-sonnet}
REPS=${REPS:-1}
PARALLEL=${PARALLEL:-4}

# Internal: run one case/rep. Invoked by xargs below.
if [ "${1:-}" = "--run-one" ]; then
  ID=$2; REP=$3   # SKILL and OUT come from the environment
  CASE=$(jq -c --arg id "$ID" '.[] | select(.id == $id)' "$CASES")
  DIR="$OUT/$ID/r$REP"; mkdir -p "$DIR"
  WORK=$(mktemp -d)   # empty cwd: no CLAUDE.md or project skills, isolated --continue
  RESULTS="$DIR/results.txt"; : > "$RESULTS"
  record() { printf '%s\t%s\t%s\t%s\n' "$ID" "r$REP" "$1" "$2" >> "$RESULTS"; }

  N=$(jq '.turns | length' <<< "$CASE")
  for ((i = 0; i < N; i++)); do
    MSG=$(jq -r ".turns[$i]" <<< "$CASE")
    printf '%s\n' "$MSG" > "$DIR/user$((i + 1)).md"
    # claude -p treats a leading "/" as its own slash command; claude.ai doesn't, so pad it.
    case "$MSG" in /*) MSG=" $MSG" ;; esac
    CONT=(); [ "$i" -gt 0 ] && CONT=(--continue)
    (cd "$WORK" && claude -p --setting-sources project ${CONT[@]+"${CONT[@]}"} --model "$MODEL" --append-system-prompt "$(cat "$SKILL")" "$MSG" < /dev/null) \
      > "$DIR/turn$((i + 1)).md" 2> "$DIR/turn$((i + 1)).err" || echo $? > "$DIR/turn$((i + 1)).exit"
  done

  # A failed call or usage-limit reply isn't a result — record it as ERROR and skip grading.
  # Judged by exit code and the reply's first line, not its content (a reply may discuss rate limits).
  if ls "$DIR"/turn*.exit >/dev/null 2>&1 \
    || head -qn1 "$DIR"/turn*.md | grep -qiE "^(you've hit your (session|usage) limit|api error)"; then
    record ERROR "claude -p returned an error or usage-limit message; rerun this case"
    rm -rf "$WORK"; exit 0
  fi

  NC=$(jq '.checks | length' <<< "$CASE")
  for ((c = 0; c < NC; c++)); do
    CHK=$(jq -c ".checks[$c]" <<< "$CASE")
    T=$(jq -r '.turn' <<< "$CHK"); TYPE=$(jq -r '.type' <<< "$CHK")
    F="$DIR/turn$T.md"; PASS=0; DETAIL=""
    case "$TYPE" in
      present) P=$(jq -r '.pattern' <<< "$CHK"); grep -Eiq -- "$P" "$F" && PASS=1; DETAIL="present /$P/" ;;
      absent)  P=$(jq -r '.pattern' <<< "$CHK"); grep -Eiq -- "$P" "$F" || PASS=1; DETAIL="absent /$P/" ;;
      max_words)
        V=$(jq -r '.value' <<< "$CHK"); W=$(wc -w < "$F" | tr -d ' ')
        [ "$W" -le "$V" ] && PASS=1; DETAIL="words $W <= $V" ;;
      no_preamble)
        FIRST=$(grep -m1 -v '^[[:space:]]*$' "$F" || true)
        echo "$FIRST" | grep -Eiq '^(using|i.ll|let me|running|applying|invoking)|pressure[- ]?test skill' || PASS=1
        DETAIL="first line: ${FIRST:0:60}" ;;
      max_items)
        S=$(jq -r '.section' <<< "$CHK"); V=$(jq -r '.value' <<< "$CHK")
        CNT=$(awk -v sec="$S" '
          function hdr(l) { return (l ~ /^#+ / || l ~ /^\*\*[^*]+\*\*:?[[:space:]]*$/ || tolower(l) ~ /^\*\*(mirror|blind spot|counter|analogy|verdict)/) }
          hdr($0) {
            if (on) exit
            if (index(tolower($0), sec)) { on = 1; if ($0 ~ /\*\*:?[[:space:]]*[[:alnum:]]/) text = 1 }   # inline "**Blind spot:** text"
            next
          }
          on && /^(\*\*)?([0-9]+\.|[-*]) / { n++ }
          on && /[[:alnum:]]/ { text = 1 }
          END { print (n == 0 && text ? 1 : n + 0) }' "$F")   # one unnumbered paragraph = one item
        [ "$CNT" -ge 1 ] && [ "$CNT" -le "$V" ] && PASS=1; DETAIL="$S items $CNT <= $V" ;;
      scorecard_order)
        ROWS=$(grep '^|' "$F" | grep -v -- '---' | tail -n +2 || true)
        FIRST=$(head -1 <<< "$ROWS" | tr '[:upper:]' '[:lower:]'); LAST=$(tail -1 <<< "$ROWS" | tr '[:upper:]' '[:lower:]')
        [[ "$FIRST" == *"core insight"* && "$LAST" == *"biggest risk"* ]] && PASS=1; DETAIL="Core Insight first, Biggest Risk last" ;;
      max_table_rows)
        V=$(jq -r '.value' <<< "$CHK")
        R=$(awk '/^\|/ { t = 1; if ($0 !~ /---/) n++; next } t { exit } END { print (n > 0 ? n - 1 : 0) }' "$F")
        [ "$R" -le "$V" ] && PASS=1; DETAIL="table rows $R <= $V" ;;
      *) DETAIL="unknown check $TYPE" ;;
    esac
    record "$([ $PASS = 1 ] && echo PASS || echo FAIL)" "t$T $DETAIL"
  done

  RUBRIC=$(jq -r '.judge // empty' <<< "$CASE")
  if [ -n "$RUBRIC" ]; then
    TRANSCRIPT=""
    for ((i = 1; i <= N; i++)); do
      TRANSCRIPT+=$'\n\n### USER\n'"$(cat "$DIR/user$i.md")"$'\n\n### ASSISTANT\n'"$(cat "$DIR/turn$i.md")"
    done
    JUDGE_DIR=$(mktemp -d)
    VERDICT=$(cd "$JUDGE_DIR" && claude -p --setting-sources project --model "$JUDGE_MODEL" "You are grading one conversation with an AI 'pressure test' sparring partner against a rubric. Be strict and literal.

Rubric: $RUBRIC

Reply with PASS or FAIL alone on the first line, then one sentence of reason quoting the output where relevant.

Conversation:$TRANSCRIPT" < /dev/null 2>&1 || true)
    printf '%s\n' "$VERDICT" > "$DIR/judge.md"
    RESULT=$(head -1 <<< "$VERDICT" | grep -Eo 'PASS|FAIL' || echo ERROR)
    REASON=$(tr '\n' ' ' <<< "$VERDICT" | sed -E 's/^[[:space:]*]*(PASS|FAIL)[^[:alnum:]"]*//' | cut -c1-160)
    record "$RESULT" "judge: $REASON"
  fi
  rm -rf "$WORK"
  exit 0
fi

SKILL=""; OUT=""; ONLY=""
while [ $# -gt 0 ]; do
  case "$1" in
    --skill) SKILL=$2; shift 2 ;;
    --out) OUT=$2; shift 2 ;;
    --only) ONLY=$2; shift 2 ;;
    *) echo "Unknown option $1" >&2; exit 2 ;;
  esac
done
if [ -z "$SKILL" ]; then
  (cd "$ROOT" && scripts/build-dist.sh)
  SKILL="$ROOT/dist/pressure-test-skill.md"
fi
SKILL=$(cd "$(dirname "$SKILL")" && pwd)/$(basename "$SKILL")
OUT=${OUT:-"$ROOT/evals/results/$(date +%Y%m%d-%H%M%S)"}
mkdir -p "$OUT"; OUT=$(cd "$OUT" && pwd)

IDS=$(jq -r '.[].id' "$CASES")
[ -n "$ONLY" ] && IDS=$(grep -x -- "$ONLY" <<< "$IDS")
echo "Running $(wc -l <<< "$IDS" | tr -d ' ') case(s) x $REPS rep(s) with $MODEL -> $OUT"
export SKILL OUT
for id in $IDS; do for ((r = 1; r <= REPS; r++)); do echo "$id $r"; done; done \
  | xargs -P "$PARALLEL" -n 2 "$0" --run-one

SUMMARY="$OUT/summary.md"
{
  echo "# Eval results"
  echo
  echo "Skill: \`$SKILL\` · model: $MODEL · judge: $JUDGE_MODEL · reps: $REPS"
  echo
  echo "| Case | Rep | Result | Check |"
  echo "| --- | --- | --- | --- |"
  cat "$OUT"/*/r*/results.txt | sort | awk -F'\t' '{ gsub(/\|/, "\\|", $4); printf "| %s | %s | %s | %s |\n", $1, $2, $3, $4 }'
  echo
  P=$(cat "$OUT"/*/r*/results.txt | awk -F'\t' '$3 == "PASS"' | wc -l | tr -d ' ')
  T=$(cat "$OUT"/*/r*/results.txt | wc -l | tr -d ' ')
  E=$(cat "$OUT"/*/r*/results.txt | awk -F'\t' '$3 == "ERROR"' | wc -l | tr -d ' ')
  echo "**$P / $((T - E)) checks passed** ($E errored — rerun those with \`--only\`). Transcripts are in each case's folder — read the failures before trusting the numbers."
} > "$SUMMARY"
cat "$SUMMARY"
