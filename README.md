# Pressure Test

A Claude skill that acts as a thinking sparring partner — strengthening ideas through genuine challenge, not polite agreement.

**Author:** Richard Drew

---

## What It Does

Pressure Test runs your idea through five structured moves:

1. **Mirror** — Presents the strongest possible version of your idea (steel-manning it) so you're both working from the same foundation
2. **Blind Spots** — Surfaces what you can't see from your vantage point
3. **Counter-Punch** — Presents the best good-faith argument against you, voiced by a credible archetype
4. **Analogy Flip** — Reframes the idea using your own mode of thinking to reveal angles you've missed
5. **Verdict Card** — Coach's notes after the round: a scorecard, a Quick Fix, and a Structural Move

Intensity levels let you dial from a collaborative think-out-loud (`light`) to a no-holds-barred challenge (`full`). An optional `optionality` parameter unlocks an Optional Stretch section in the Verdict Card with three named alternative paths forward.

---

## Get Started

### Option A — Claude.ai, desktop, or mobile (no install)

Everything for claude.ai users lives in the [claude-pressure-test gist](https://gist.github.com/richardkdrew/c062631fdfee41fac10e815973576407). Pick one:

- **Skill upload** (paid plans; works in every chat) — download [pressure-test.zip](https://github.com/richardkdrew/claude-pressure-test/releases/latest/download/pressure-test.zip), then in Claude open **Settings → Capabilities**, find **Skills**, and upload it.
- **Project** (any plan; works inside that Project) — open the [skill file](https://gist.githubusercontent.com/richardkdrew/c062631fdfee41fac10e815973576407/raw/pressure-test-skill.md), select all, copy, and paste it into a Project's **Instructions**.
- **One-off** — paste the same [skill file](https://gist.githubusercontent.com/richardkdrew/c062631fdfee41fac10e815973576407/raw/pressure-test-skill.md) at the start of any conversation.

Then type `/pt` or `/pressure-test` followed by your idea. To update, repeat the same steps — the links always point to the latest version.

### Sharing with colleagues

If you want to share this with non-technical colleagues, send them the [gist link](https://gist.github.com/richardkdrew/c062631fdfee41fac10e815973576407) rather than this page — it's designed as the entry point for anyone on claude.ai with no GitHub account or command line needed.

### Option B — Claude Code (CLI, desktop app, IDE)

**Current version: v2.6**

```bash
mkdir -p ~/.claude/skills/pressure-test && \
curl -fsSL https://raw.githubusercontent.com/richardkdrew/claude-pressure-test/v2.6/SKILL.md \
  -o ~/.claude/skills/pressure-test/SKILL.md
```

Then use `/pressure-test` followed by your idea, or just ask Claude to "pressure test" something. In Claude Code the command is `/pressure-test` — `/pt` isn't a registered command there. If `/pressure-test` doesn't appear, start a new Claude Code session.

To share it with a team through a repo instead, put the same file at `.claude/skills/pressure-test/SKILL.md` in that repo.

To check your installed version:

```bash
grep "version:" ~/.claude/skills/pressure-test/SKILL.md
```

To update to the latest release:

```bash
curl -fsSL https://github.com/richardkdrew/claude-pressure-test/releases/latest/download/SKILL.md \
  -o ~/.claude/skills/pressure-test/SKILL.md
```

---

## Usage

The examples use `/pt`. In Claude Code, type `/pressure-test` instead.

### Basic

```text
/pt Your idea here
```

### With intensity level

```text
/pt light Is remote work permanently changing how teams build trust?

/pt medium The best AI products right now are tools, not agents.

/pt full Organisational hierarchy exists primarily to protect bad managers, not to coordinate work.
```

### With optionality

```text
/pt full optionality: on We should sunset our legacy API and force migration within 6 months.
```

When `optionality: on` is set, the Verdict Card includes an **Optional Stretch** section with three named alternative approaches — 2–3 sentences each at `full`, one sentence each at `medium`. It's ignored at `light`.

### Intensity levels

| Level | Mirror | Blind Spots | Counter-Punch | Analogy Flip | Verdict Card |
| ------- | -------- | ------------- | --------------- | -------------- | -------------- |
| `light` | Clean restatement | 1–2 gentle flags | Skipped | Brief reframe | 2–3 sentences |
| `medium` | + implicit claims | 2–3 with explanation | 2–3 sentences | Developed analogy | Short paragraph |
| `full` | + all assumptions named, then waits for you | Numbered, only the ones that change the decision | Voiced archetype, italicised | Rich scenario, specific | Scorecard table + moves |

**Default intensity is `full` if none is specified.**

At `full`, Claude stops after the Mirror to check it has understood you before it challenges anything — reply to confirm or correct it, and the rest follows. `light` and `medium` run in a single response.

For short punchy takes — a hot take, a one-sentence claim, a quick POV — `medium` typically delivers more useful output than `full`. The scorecard table in a full Verdict Card suits a developed argument; on a punchy claim it adds distance instead of sharpness.

---

## Examples

### Financial strategy

```text
/pt full We should acquire a fintech rather than building in-house — we can't win the talent war and the window is closing.
```

### Hot take

```text
/pt full AI is making senior engineers less valuable, not more.
```

### Half-formed thought

```text
/pt light There's something about how we run our planning cycles that feels backwards.
```

### LinkedIn post draft

```text
/pt medium "The best leaders I've worked with never had the answer. They had the next question."
```

### Strategic decision with optionality

```text
/pt full optionality: on Our biggest competitive risk isn't another product — it's our customers learning to do without us.
```

### Revenue and go-to-market

```text
/pt medium We need to productise before we hire more salespeople — the delivery model is too bespoke to scale.
```

The more context you give, the sharper the challenge — paste the background before the command and it's treated as part of the idea.

See [examples/](examples/) for full annotated runs across four business personas at different intensity levels.

---

## After the Pressure Test

Claude ends each session with a check-in. Three paths from there:

- **Agree** — move on or go deeper on a specific move
- **Adjust intensity** — recalibrate mid-session
- **Push back** — the best outcome; Claude engages the disagreement without folding or digging in for its own sake

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

---

## Changelog

See [CHANGELOG.md](CHANGELOG.md).

---

## License

MIT — see [LICENSE](LICENSE).
