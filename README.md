# Pressure Test

A Claude skill that acts as a thinking sparring partner — strengthening ideas through genuine challenge, not polite agreement.

**Author:** Richard Drew

---

## What It Does

Pressure Test runs your idea through five structured moves:

1. **Mirror** — Steel-mans your position so you're both working from the strongest version of the idea
2. **Blind Spots** — Surfaces what you can't see from your vantage point
3. **Counter-Punch** — Presents the best good-faith argument against you, voiced by a credible archetype
4. **Analogy Flip** — Reframes the idea using your own mode of thinking to reveal angles you've missed
5. **Verdict Card** — Coach's notes after the round: a scorecard, a Quick Fix, and a Structural Move

Intensity levels let you dial from a collaborative think-out-loud (`light`) to a no-holds-barred challenge (`full`). An optional `optionality` parameter unlocks an Optional Stretch section in the Verdict Card with three named alternative paths forward.

---

## Installation

This skill is built for [Claude Code](https://claude.ai/code) using the [Claude Agent SDK](https://docs.anthropic.com/claude/docs/claude-agent-sdk) skill system.

1. Clone or download this repo
2. Copy `SKILL.md` into your Claude skills directory (typically `~/.claude/skills/` or your project's `.claude/skills/`)
3. Restart Claude Code — the skill will be auto-discovered

> The skill responds to both `/pressure-test` and `/pt` trigger commands.

---

## Usage

### Basic

```
/pt Your idea here
```

```
/pressure-test Your idea here
```

### With intensity level

```
/pt light Is remote work permanently changing how teams build trust?

/pt medium The best AI products right now are tools, not agents.

/pt full Organisational hierarchy exists primarily to protect bad managers, not to coordinate work.
```

### With optionality

```
/pt full optionality: on We should sunset our legacy API and force migration within 6 months.
```

When `optionality: on` is set, the Verdict Card includes an **Optional Stretch** section with three named alternative approaches, each described in 2–3 sentences.

### Intensity levels

| Level | Mirror | Blind Spots | Counter-Punch | Analogy Flip | Verdict Card |
|-------|--------|-------------|---------------|--------------|--------------|
| `light` | Clean restatement | 1–2 gentle flags | Skipped | Brief reframe | 2–3 sentences |
| `medium` | + implicit claims | 2–3 with explanation | 2–3 sentences | Developed analogy | Short paragraph |
| `full` | + all assumptions named | Numbered, full weight | Voiced archetype, italicised | Rich scenario, specific | Scorecard table + three moves |

**Default intensity is `full` if none is specified.**

---

## Examples

### Hot take

```
/pt full AI is making senior engineers less valuable, not more.
```

### LinkedIn post draft

```
/pt medium "The best leaders I've worked with never had the answer. They had the next question."
```

### Strategic read

```
/pt full optionality: on Our biggest competitive risk isn't another product — it's our customers learning to do without us.
```

### Half-formed thought

```
/pt light There's something about how we run retros that's backwards
```

---

## Using on Mobile / Claude.ai

Skills require Claude Code (CLI, desktop app, or IDE extension) and won't load in the Claude mobile app or claude.ai directly. The workaround is Claude's **Projects** feature, which is available on both web and mobile.

**Setup (one time):**

1. Open [claude.ai](https://claude.ai) and create a new Project
2. Go to the project's **Custom instructions**
3. Paste the full contents of `SKILL.md` into the instructions field and save

**Using it:**

Once the instructions are set, open any conversation inside that project — on web or mobile — and use `/pt` or `/pressure-test` exactly as you would in Claude Code.

```
/pt full The hustle culture backlash has gone too far.
```

The skill behaviour (all five moves, intensity levels, optionality) works the same way. The only difference is that Claude is reading the skill from project instructions rather than a skill file.

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
