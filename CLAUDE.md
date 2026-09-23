# Pressure Test — Project Guide

## What this repo is

A Claude skill that acts as a thinking sparring partner. The canonical skill is `SKILL.md`. The gist is the primary distribution artifact for claude.ai users.

## Key files

| File | Purpose |
| ---- | ------- |
| `SKILL.md` | Canonical skill — the only copy of the skill content |
| `gist/claude-pressure-test.md` | Setup guide shown first in the gist (hand-edited) |
| `scripts/build-dist.sh` | Builds the gist's skill file and the release assets from `SKILL.md` |
| `scripts/version.sh` | Reads the version from `SKILL.md` frontmatter (`metadata.version`) |
| `evals/cases.json`, `scripts/run-evals.sh` | Behaviour evals — real conversations via `claude -p`, scripted checks plus a judge model. Run before any release that changes skill content |
| `.claude/skills/release/`, `.claude/skills/fix/` | `/release` and `/fix` — the release and fix workflows |
| `examples/` | Annotated example runs across four personas |
| `CHANGELOG.md` | Version history |
| `CONTRIBUTING.md` | Contribution guidelines and release checklist |

## Release process

Always branch new releases from `main`, not from a previous release branch — branching from a release branch causes merge conflicts when the earlier PR is merged via GitHub's merge commit.

Use `/release` for anything that changes skill content and `/fix` for small doc corrections. The full checklist lives in `.claude/skills/release/SKILL.md` — that file is the single source; don't duplicate it here.

After merge, the `on-merge` workflow creates the GitHub release and tag (with `SKILL.md` and `pressure-test.zip` attached) and republishes the gist.

## The gist is generated from SKILL.md

The gist has two files: `claude-pressure-test.md` (the setup guide, from `gist/claude-pressure-test.md`) and `pressure-test-skill.md` (the skill body, generated from `SKILL.md` at publish time). Edit skill content only in `SKILL.md`. There is no second copy to keep in sync.

## Pull requests

When opening a PR, use the template in `.github/PULL_REQUEST_TEMPLATE.md`. For release branches the before/after section should show the relevant skill file change (or note "no skill output changes" for infrastructure-only releases). Fill every section — don't leave placeholders.

## Design intent

The skill's voice is sparring partner, not professor. Changes that strengthen that — sharper prompting, better intensity calibration, tighter tone guidance — are in character. Changes that drift toward comprehensiveness, hedging, or academic structure are not. See `CONTRIBUTING.md` for what makes a good PR.
