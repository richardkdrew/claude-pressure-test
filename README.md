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

Then type `/pressure-test` (or the shorthand `/pt`) followed by your idea. To update, repeat the same steps — the links always point to the latest version.

**Rolling it out to a team?** Pin a version instead of "latest": `https://github.com/richardkdrew/claude-pressure-test/releases/download/v2.7/pressure-test.zip` (swap in the version you've vetted). If your organisation provisions skills centrally, give your admin that zip. To hear about new versions, use **Watch → Custom → Releases** on this repo.

**Privacy:** the skill sends nothing anywhere — it's instructions for Claude. What you type goes wherever your Claude chats go, so anonymise names and client details you wouldn't put in any other chat.

### Sharing with colleagues

If you want to share this with non-technical colleagues, send them the [gist link](https://gist.github.com/richardkdrew/c062631fdfee41fac10e815973576407) rather than this page — it's designed as the entry point for anyone on claude.ai with no GitHub account or command line needed.

### Option B — Claude Code (CLI, desktop app, IDE)

**Current version: v2.7**

```bash
mkdir -p ~/.claude/skills/pressure-test && \
curl -fsSL https://raw.githubusercontent.com/richardkdrew/claude-pressure-test/v2.7/SKILL.md \
  -o ~/.claude/skills/pressure-test/SKILL.md
```

Then use `/pressure-test` followed by your idea, or just ask Claude to "pressure test" something. In Claude Code the command is `/pressure-test` — `/pt` isn't a registered command there. If `/pressure-test` doesn't appear, start a new Claude Code session.

To check your installed version, or update to the latest release:

```bash
grep "version:" ~/.claude/skills/pressure-test/SKILL.md

curl -fsSL https://github.com/richardkdrew/claude-pressure-test/releases/latest/download/SKILL.md \
  -o ~/.claude/skills/pressure-test/SKILL.md
```

#### Sharing with a team through a repo

Run this from the repo's root and commit the file — everyone who opens the repo in Claude Code gets `/pressure-test`:

```bash
mkdir -p .claude/skills/pressure-test && \
curl -fsSL https://raw.githubusercontent.com/richardkdrew/claude-pressure-test/v2.7/SKILL.md \
  -o .claude/skills/pressure-test/SKILL.md
```

Check or update it the same way, with `.claude/skills/pressure-test/SKILL.md` as the path.

---

## Usage

`/pressure-test` works everywhere. On claude.ai you can also use the shorthand `/pt`.

### Basic

```text
/pressure-test Your idea here
```

### With intensity level

```text
/pressure-test light Is remote work permanently changing how teams build trust?

/pressure-test medium The best AI products right now are tools, not agents.

/pressure-test full Organisational hierarchy exists primarily to protect bad managers, not to coordinate work.
```

### With optionality

```text
/pressure-test full optionality: on We should sunset our legacy API and force migration within 6 months.
```

When `optionality: on` is set, the Verdict Card includes an **Optional Stretch** section with three named alternative approaches — 2–3 sentences each at `full`, one sentence each at `medium`. It's ignored at `light`.

### Intensity levels

| Level | Mirror | Blind Spots | Counter-Punch | Analogy Flip | Verdict Card |
| ------- | -------- | ------------- | --------------- | -------------- | -------------- |
| `light` | Clean restatement | 1–2 gentle flags | Skipped | Brief reframe | 2–3 sentences |
| `medium` | + implicit claims | 2–3 with explanation | 2–3 sentences | Developed analogy | Short paragraph |
| `full` | + all assumptions named, then waits for you | 1–3, numbered — only the ones that change the decision | Voiced archetype, italicised | Rich scenario, specific | Scorecard table (sized to the idea) + moves |

**Default intensity is `medium` if none is specified** — one response, around 450 words.

At `full`, Claude stops after the Mirror to check it has understood you before it challenges anything — reply to confirm or correct it, and the rest follows. `light` and `medium` run in a single response and invite you to say if the Mirror misread you.

Use `full` for decisions that are hard to reverse and worth ten minutes — a developed argument, a board paper, an RFC. For a hot take or a quick POV, the default `medium` is usually sharper.

If your idea holds up, Pressure Test says so and keeps the verdict short. Anything it states as fact should be something it's confident is true — but check any number or real-world case before you repeat it in a room that matters.

---

## Examples

### Financial strategy

```text
/pressure-test full We should acquire a fintech rather than building in-house — we can't win the talent war and the window is closing.
```

### Hot take

```text
/pressure-test full AI is making senior engineers less valuable, not more.
```

### Half-formed thought

```text
/pressure-test light There's something about how we run our planning cycles that feels backwards.
```

### LinkedIn post draft

```text
/pressure-test medium "The best leaders I've worked with never had the answer. They had the next question."
```

### Strategic decision with optionality

```text
/pressure-test full optionality: on Our biggest competitive risk isn't another product — it's our customers learning to do without us.
```

### Revenue and go-to-market

```text
/pressure-test medium We need to productise before we hire more salespeople — the delivery model is too bespoke to scale.
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
