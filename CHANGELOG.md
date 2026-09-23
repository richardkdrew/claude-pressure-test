# Changelog

All notable changes to the Pressure Test skill are documented here.

---

## v2.7 — 2026-09-23

Driven by six independent persona reviews of v2.6 (about 45 real conversations) and a new behaviour-eval suite.

### Changed

- **Default intensity is now `medium`** — one response, around 450 words. `full` is still there for decisions worth ten minutes
- **Grounding applies to every move** — anything stated as fact, including in the Counter-Punch's voice, must be something Claude is confident is true; unsure statistics and real cases are labelled as rough guesses or left out
- **Counter-Punch archetype is a role, not a named person** — no invented names or résumés; the example archetype is now "the customer who churned last quarter", matching the rule that it shouldn't be a more senior version of the user
- **Works from what the user said** — no invented role, stage, team, or history; missing facts that matter are named as assumptions
- **Checks the user's numbers** — load-bearing arithmetic is recomputed in the Mirror before anything is challenged
- **Scales to the idea** — 1–3 blind spots at full ("one is often right"); a narrow idea gets a small scorecard
- **Ideas that hold get a short verdict** — "ship it; watch X", even at full
- **Analogy Flip can step aside** — if the best analogy only restates a Blind Spot, Claude says so in a line and moves on
- **Mirror** — at full, assumptions are named neutrally and judged only after the user confirms; at light and medium, the Mirror ends with "If I've misread you, say so and I'll rerun from here" instead of a question it doesn't wait for
- **Structural Move** — "stage it" / "pilot first" only when the stages and stop condition can be named
- **Concessions** — replacement advice after pushback is tested as hard as the original
- **People decisions** — no assumed jurisdiction, HR/legal flagged, challenge the decision not the person
- **Docs** — `/pressure-test` used throughout (works everywhere; `/pt` is the claude.ai shorthand); repo-install commands; pinned-version zip and release notifications for team rollouts; privacy note; gist guide retitled "Pressure Test — Setup"
- **Examples** — regenerated with v2.7 in an isolated setup, headings normalised, content unedited; new runs show a Mirror correction, a pushback with a partial concession, and a sound idea at the default intensity. One run with inaccurate real-world claims was discarded and regenerated (noted in `examples/README.md`)

### Added

- **Behaviour evals** — `evals/cases.json` and `scripts/run-evals.sh`: 15 cases run as real conversations through `claude -p`, scripted checks plus a judge model. Runs use `--setting-sources project` so the tester's own plugins, hooks, and CLAUDE.md don't leak in. Usage-limit and API errors are reported as ERROR, not FAIL. Run before releases that change skill content; `/release` now includes the step. v2.6 → v2.7 on the same cases, 2 reps each: **58 → 70 of 76 checks** (a small sample — directional, not precise)
- **CI** — fails if any versioned URL in the README doesn't match the current version

### Fixed

- **Optional Stretch length** — "two to three sentences" now applies at full only; medium is one sentence per approach, as documented in v2.6
- **No preamble** — the skill now says to open with the Mirror. Some of the "Using the pressure-test skill…" lines reported in the v2.6 reviews came from the reviewers' own Claude Code plugins, which the evals now isolate against; isolated runs still occasionally open with a short preamble

---

## v2.6 — 2026-09-23

v2.5 was never released; its install-path fix ships here.

### Changed

- **Mirror waits at full intensity** — at `full`, the Mirror is its own turn: Claude checks it has understood the idea and waits for the reply before challenging it. `light` and `medium` still run in one response, and a corrected mirror reruns from Blind Spots
- **Blind spots: fewer, sharper** — full intensity now asks for the blind spots that would change the decision, not every one that can be found ("two sharp ones beat six padded ones")
- **Room to say an idea holds up** — new tone guideline: if the idea mostly holds, say so and put the pressure on the one place it doesn't
- **Optionality at medium** — `optionality: on` now adds a short Optional Stretch (one sentence per approach) at `medium`; it's ignored at `light`
- **Input format** — syntax now reads `[light | medium | full] [optionality: on]`, matching how it's actually typed
- **Examples** — full-intensity runs show the Mirror pause; each run notes the context it was given; unverifiable historical analogies (coal preparation plants, IBM Global Services) replaced with clearly framed hypotheticals; Tumblr analogy trimmed to verifiable facts; Priya's counter-punch archetype made consistent
- **Gist restructured** — two files: a setup guide and the skill itself, generated from `SKILL.md` at publish, so it can be opened raw and copied in one go
- **Release process in one place** — `.claude/skills/release/SKILL.md` is the single source; CLAUDE.md and CONTRIBUTING.md point to it

### Added

- **Analogy grounding rule** — real cases only when Claude is confident they happened as described; otherwise framed as a hypothetical
- **claude.ai skill upload** — each release attaches `pressure-test.zip` for Settings → Capabilities → Skills, plus `SKILL.md` for a stable "latest" download URL
- **Update instructions** for both claude.ai and Claude Code
- **CI** — exact checks on both README version locations, a failing check when `SKILL.md` changes without a version bump, a dist build check, and markdownlint
- `.gitignore`

### Fixed

- **Option B install path** — curl now writes to `~/.claude/skills/pressure-test/SKILL.md` (folder + SKILL.md) instead of a flat file Claude Code never discovered, and creates the folder first
- **Safer download** — `curl -fsSL … -o` fails loudly on a bad URL and leaves an existing install untouched (previously a 404 could overwrite the skill with an error page, or empty it)
- **`/pt` in Claude Code** — README no longer promises `/pt` there; Claude Code registers `/pressure-test` only
- **Frontmatter** — `version` moved under `metadata:` so the skill passes Anthropic's skill validator (required for claude.ai upload)
- **`/release` and `/fix` repo skills** — moved into folders so Claude Code actually discovers them
- **`/fix` guidance** — removed the claim that fixes appear in automated release notes; skill-content changes must go through `/release`
- **Manual workflow runs** — `workflow_dispatch` now always republishes the gist
- README said "three business personas"; there are four

---

## v2.4 — 2026-05-24

### Changed

- **Mirror step rebuilt** — instruction changed from "restate" to "reconstruct": name the best arguments supporting the idea even if the user didn't articulate them; after presenting the mirror, check in ("Does that capture it?") before proceeding to Blind Spots
- **Analogy Flip sharpened** — new instruction to identify the logical structure being mirrored (the relationship between elements, not the topic) before choosing a scenario; an analogy that works by surface association but not structural parallel will feel clever and land wrong
- **Counter-Punch rigor criterion added** — choose the argument that would most directly undermine the core claim, not just the most rhetorically credible objection; the archetype gives it voice, the logic gives it teeth
- **Trigger extended** — the command may now appear at the start or end of a message; context provided before or after the trigger is treated as part of the idea
- **Input format broadened** — example use cases updated to include philosophical positions, creative principles, personal decisions; "LinkedIn post draft" removed as a first-class example
- **Example runs updated** — all four persona examples regenerated to reflect updated skill behaviour; new analogies (Michelin star kitchen, IBM Global Services, coal preparation workers, radiology) and new counter-punch archetypes across the runs
- **Workflow hardened** — `curl --fail` added to gist publish step; `workflow_dispatch` trigger added; gist ID moved to job-level env var
- **Version consistency CI check** — new `version-check.yml` workflow verifies version sync across SKILL.md, README, gist, and CHANGELOG on every PR to main

---

## v2.3 — 2026-05-24

### Added

- **Release automation** — `on-merge` workflow now automatically publishes the gist and creates the GitHub release and tag on every merge to main; no manual web UI steps required
- **PR template guidance** — CLAUDE.md documents how to fill the PR template for release and infrastructure branches

### Changed

- **Release checklist simplified** — CLAUDE.md and CONTRIBUTING.md updated to reflect automation; manual steps reduced to version bumps, CHANGELOG, and PR

---

## v2.2 — 2026-05-24

### Changed

- **Sharing prompt in gist** — one-line prompt added after setup instructions so users know to forward the gist link to colleagues
- **README sharing guidance** — explicit note for technical users to send the gist link (not the GitHub repo) when sharing with non-technical colleagues

---

## v2.1 — 2026-05-24

### Changed

- **Counter-Punch archetype guidance** — added explicit instruction to choose the archetype for structural difference, not seniority; the most useful friction comes from someone whose interests or vantage point are orthogonal to the user's, not a more senior version of them
- **Gist preamble rewritten** — clearer entry point for first-time visitors; surfaces version number, adds 90-second setup framing
- **Versioned install path** — README Option B curl command now points to a tagged release rather than `main`; includes version check one-liner
- **Intensity guidance** — README now steers users toward `medium` for short punchy takes where the full scorecard table adds distance instead of sharpness

### Fixed

- **Gist markdownlint config** — brought in line with root config to suppress false positives on long prose lines throughout the skill content

---

## v2 — 2026-05-16

### Added

- **Optionality parameter** — `/pt [intensity] optionality: on` unlocks an Optional Stretch section in the Verdict Card, surfacing three named alternative paths forward
- **Optional Stretch format** — each approach uses a consistent `[Approach Name] — content` format with 2–3 sentences: the first describes the path, the second surfaces what makes it distinctively valuable or what it reveals that the others don't

### Changed

- **Verdict Card rebuilt** — scorecard is now a dynamic dimension table rather than a fixed list; Core Insight is always first, Biggest Risk is always last, middle rows are drawn from the specific idea being tested
- **Quick Fix and Structural Move** are now explicit section headers in the Verdict Card, making the three moves more scannable
- **Blind spots numbered** — full-intensity blind spots are now explicitly numbered so they're easier to reference and respond to
- **Formatting consistency** — tightened formatting rules throughout to reduce output variance across runs

---

## v1 — initial release

### Added

- Five-move structure: Mirror, Blind Spots, Counter-Punch, Analogy Flip, Verdict Card
- Three intensity levels: `light`, `medium`, `full` — with `full` as the default
- Trigger commands: `/pressure-test` and `/pt`
- Tone guidelines: sparring partner framing, energy-matching, no opening praise
- Post-session check-in to open dialogue on pushback, intensity adjustment, or continuation
- Explicit "What This Skill Is NOT" guardrails
