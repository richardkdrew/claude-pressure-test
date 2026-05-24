# Pressure Test — Project Guide

## What this repo is

A Claude skill that acts as a thinking sparring partner. The canonical skill is `SKILL.md`. The gist (`gist/claude-pressure-test.md`) is the primary distribution artifact for claude.ai users.

## Key files

| File | Purpose |
|------|---------|
| `SKILL.md` | Canonical skill — installed via Claude Code Option B |
| `gist/claude-pressure-test.md` | Distribution artifact for claude.ai / Option A users |
| `examples/` | Annotated example runs across four personas |
| `CHANGELOG.md` | Version history |
| `CONTRIBUTING.md` | Contribution guidelines and release checklist |

## Release process

When making changes to `SKILL.md` or `gist/claude-pressure-test.md`, follow this checklist. All steps are required — the curl install path points to a tagged release, so a missing tag means users can't install the new version.

1. Bump `version:` in `SKILL.md` frontmatter (e.g. `2.1` → `2.2`)
2. Update the version in the gist preamble to match
3. Add an entry to `CHANGELOG.md`
4. Update the version number in the `README.md` Option B curl URL
5. Commit and push
6. Tag the release via GitHub web UI: go to the repo → **Releases** → **Draft a new release** → create tag `vX.Y` → set title `vX.Y` → paste the CHANGELOG entry → **Publish release**

## SKILL.md and the gist must stay in sync

Any change to the skill content in `SKILL.md` must be mirrored to `gist/claude-pressure-test.md`. The gist contains the full skill content after its preamble section (from `# Pressure Test` to the end).

## Design intent

The skill's voice is sparring partner, not professor. Changes that strengthen that — sharper prompting, better intensity calibration, tighter tone guidance — are in character. Changes that drift toward comprehensiveness, hedging, or academic structure are not. See `CONTRIBUTING.md` for what makes a good PR.
