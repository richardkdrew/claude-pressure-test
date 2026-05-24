# Pressure Test — Project Guide

## What this repo is

A Claude skill that acts as a thinking sparring partner. The canonical skill is `SKILL.md`. The gist (`gist/claude-pressure-test.md`) is the primary distribution artifact for claude.ai users.

## Key files

| File | Purpose |
| ---- | ------- |
| `SKILL.md` | Canonical skill — installed via Claude Code Option B |
| `gist/claude-pressure-test.md` | Distribution artifact for claude.ai / Option A users |
| `examples/` | Annotated example runs across four personas |
| `CHANGELOG.md` | Version history |
| `CONTRIBUTING.md` | Contribution guidelines and release checklist |

## Release process

Always branch new releases from `main`, not from a previous release branch — branching from a release branch causes merge conflicts when the earlier PR is merged via GitHub's merge commit.

```bash
git checkout main && git pull && git checkout -b release/vX.Y
```

When making changes to `SKILL.md` or `gist/claude-pressure-test.md`, follow this checklist:

1. Bump `version:` in `SKILL.md` frontmatter (e.g. `2.2` → `2.3`)
2. Update the version in the gist preamble to match
3. Add an entry to `CHANGELOG.md`
4. Update the version number in the `README.md` Option B curl URL
5. Commit, push, open PR, merge

After merge, the `on-merge` workflow runs automatically and handles:

- Publishing the updated gist
- Creating the GitHub release and tag from the version in `SKILL.md`

## SKILL.md and the gist must stay in sync

Any change to the skill content in `SKILL.md` must be mirrored to `gist/claude-pressure-test.md`. The gist contains the full skill content after its preamble section (from `# Pressure Test` to the end).

## Pull requests

When opening a PR, use the template in `.github/PULL_REQUEST_TEMPLATE.md`. For release branches the before/after section should show the relevant skill file change (or note "no skill output changes" for infrastructure-only releases). Fill every section — don't leave placeholders.

## Design intent

The skill's voice is sparring partner, not professor. Changes that strengthen that — sharper prompting, better intensity calibration, tighter tone guidance — are in character. Changes that drift toward comprehensiveness, hedging, or academic structure are not. See `CONTRIBUTING.md` for what makes a good PR.
