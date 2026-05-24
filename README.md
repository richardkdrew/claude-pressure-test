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

### Option A — Claude.ai or mobile (no install)

The simplest path. Works on web, desktop, and mobile.

1. Open the [claude-pressure-test gist](https://gist.github.com/richardkdrew/c062631fdfee41fac10e815973576407) and copy everything from `# Pressure Test` to the end
2. Open [claude.ai](https://claude.ai) and create a new Project
3. Go to the project's **Custom instructions**, paste, and save
4. Open any conversation inside that project and use `/pt` or `/pressure-test`

### Sharing with colleagues

If you want to share this with non-technical colleagues, send them the [gist link](https://gist.github.com/richardkdrew/c062631fdfee41fac10e815973576407) rather than this page — it's designed as the entry point for anyone on claude.ai with no GitHub account or command line needed.

### Option B — Claude Code (CLI, desktop app, IDE)

**Current version: v2.4**

```bash
curl -sL https://raw.githubusercontent.com/richardkdrew/claude-pressure-test/v2.4/SKILL.md \
  > ~/.claude/skills/pressure-test.md
```

Restart Claude Code — the skill is auto-discovered and responds to `/pt` and `/pressure-test`.

To check your installed version:

```bash
grep "^version:" ~/.claude/skills/pressure-test.md
```

---

## Usage

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

When `optionality: on` is set, the Verdict Card includes an **Optional Stretch** section with three named alternative approaches, each described in 2–3 sentences.

### Intensity levels

| Level | Mirror | Blind Spots | Counter-Punch | Analogy Flip | Verdict Card |
| ------- | -------- | ------------- | --------------- | -------------- | -------------- |
| `light` | Clean restatement | 1–2 gentle flags | Skipped | Brief reframe | 2–3 sentences |
| `medium` | + implicit claims | 2–3 with explanation | 2–3 sentences | Developed analogy | Short paragraph |
| `full` | + all assumptions named | Numbered, full weight | Voiced archetype, italicised | Rich scenario, specific | Scorecard table + three moves |

**Default intensity is `full` if none is specified.**

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

See [examples/](examples/) for full annotated runs across three business personas at different intensity levels.

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
