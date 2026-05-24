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

---

## What to Expect

I'll read every PR. I won't always respond immediately, but I will respond. If something is close but not quite right, I'll say what would make it mergeable. If it's not going to fit, I'll close it with an explanation rather than leaving it to stall.

---

## Releasing

When changes to SKILL.md or the gist are ready to ship:

1. Bump `version:` in the SKILL.md frontmatter (e.g. `2.1` → `2.2`)
2. Update the version in the gist preamble to match
3. Add an entry to CHANGELOG.md
4. Update the version number in the README.md Option B curl URL
5. Commit and push
6. Tag the release via GitHub web UI: go to the repo → **Releases** → **Draft a new release** → create tag `vX.Y` → set title `vX.Y` → paste the CHANGELOG entry → **Publish release**

The curl URL in README.md points to a tagged release, not `main` — so the tag must exist before anyone can install the new version via that path.

---

## Questions

Open an issue if you have a question about the skill's design or want to discuss a change before building it. That's a good use of issues.
