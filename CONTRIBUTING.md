# Contributing to Pressure Test

Thanks for your interest in contributing. This skill is maintained by Richard Drew and contributions are genuinely welcome — with one thing understood upfront: I control the canonical version, and I decide what merges.

That's not a bureaucratic statement. It means PRs are considered on their merits, not merged automatically. If you submit something good, it has a real chance. If it doesn't fit the design intent, I'll say why.

---

## What Makes a Good PR

The skill has a clear design philosophy: sparring partner, not professor. Changes that strengthen that — sharper prompting, better intensity calibration, tighter tone guidance, edge cases I hadn't considered — are the kinds of things worth submitting.

Changes that drift toward comprehensiveness, hedging, or academic structure are less likely to land.

**Good candidates:**

- Fixing a behaviour that's inconsistent across intensity levels
- Improving how the skill handles a specific input type (e.g. long-form drafts, frameworks, analogies)
- Clarifying ambiguous instructions in the skill file
- Catching bugs in the Optional Stretch or Verdict Card formatting logic

**Less likely to merge:**

- Adding new moves or structural sections
- Changing the tone guidelines significantly
- Rewrites that alter the voice

---

## How to Submit

1. Fork the repo
2. Make your changes in a branch
3. Open a PR with a clear description of what you changed and why
4. If there's a behaviour you're fixing, show a before/after example if you can

Edit skill content in `SKILL.md` only — the gist's copy is generated from it.

If you have Claude Code, run the behaviour evals before and after your change (`scripts/run-evals.sh --only <case>` runs one case) and include the results. A change that fixes one behaviour and breaks another is the most common way a good idea doesn't land. If you're fixing something the evals don't cover, add a case to `evals/cases.json`.

---

## What to Expect

I'll read every PR. I won't always respond immediately, but I will respond. If something is close but not quite right, I'll say what would make it mergeable. If it's not going to fit, I'll close it with an explanation rather than leaving it to stall.

---

## Releasing

Contributors don't need to bump versions — edit `SKILL.md` and open your PR. CI will flag the missing version bump; I'll add it before merging.

For maintainers, the release checklist lives in [`.claude/skills/release/SKILL.md`](.claude/skills/release/SKILL.md) (run it with `/release` in Claude Code).

---

## Questions

Open an issue if you have a question about the skill's design or want to discuss a change before building it. That's a good use of issues.
