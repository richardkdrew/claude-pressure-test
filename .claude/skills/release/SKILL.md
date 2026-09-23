---
name: release
description: Creates a new release of the Pressure Test skill. Handles branching from main, version bumps across all four locations, CHANGELOG entry, commit, push, and outputs the filled PR template ready to paste into GitHub. Trigger with /release followed by a description of what changed and why.
---

# Release Skill

You are creating a new versioned release of the claude-pressure-test repo. The user has already made their changes locally. Your job is to handle everything from branching onwards.

This file is the single source for the release process — CLAUDE.md and CONTRIBUTING.md point here.

Any change to skill content in `SKILL.md` is a release, never a `/fix`. CI fails a PR that changes `SKILL.md` without a version bump.

## Before starting

If the user hasn't provided a description of what changed, ask for it before doing anything. You need it for the CHANGELOG entry and PR template.

Clarify whether the changes include:

- Skill content changes (`SKILL.md`) — affects Before/After in the PR template
- Infrastructure/docs only — PR template notes "no skill output changes"

## Steps

### 1. Pull from main first

Fetch the latest state of main before doing anything — so you're working from current reality, not a stale local snapshot:

```bash
git fetch origin
git log --oneline origin/main -5
```

Check what's already merged. If the user's changes are already in main, say so and stop.

### 2. Capture and stash current changes

```bash
git status
git stash
```

### 3. Read current version

```bash
scripts/version.sh
```

Bump the minor version (e.g. `2.6` → `2.7`). This is the new version for this release.

### 4. Branch from main

```bash
git checkout main && git pull --rebase && git checkout -b release/vX.Y
git stash pop
```

### 5. Bump the version everywhere

Use the Edit tool (not sed) to update each precisely:

- `SKILL.md` frontmatter: `metadata:` → `version: "X.Y"`
- `gist/claude-pressure-test.md`: `**Version: X.Y**`
- `README.md`: `**Current version: vX.Y**`
- `README.md`: every versioned URL — the two curl commands (`…/vX.Y/SKILL.md`) and the pinned zip (`…/download/vX.Y/pressure-test.zip`). Find them with `grep -n "/v[0-9]" README.md`

The gist's copy of the skill (`pressure-test-skill.md`) is generated from `SKILL.md` when the release merges — never edit it by hand.

### 6. Write CHANGELOG entry

Add at the top of `CHANGELOG.md` (after the header block, before the previous release). Use today's date and the heading format `## vX.Y — YYYY-MM-DD`. Use `### Changed`, `### Added`, `### Fixed` sections as appropriate, written from the user's description. The release notes on GitHub are taken from this entry.

### 7. Check before committing

```bash
scripts/build-dist.sh && rm -rf dist
npx --yes markdownlint-cli2 "**/*.md" "#node_modules" "#dist"
```

If skill content changed, run the behaviour evals against the new skill and against the previous release, and compare:

```bash
git show origin/main:SKILL.md | sed -n '/^# Pressure Test$/,$p' > "$TMPDIR/previous-skill.md"
REPS=2 scripts/run-evals.sh --skill "$TMPDIR/previous-skill.md" --out evals/results/previous
REPS=2 scripts/run-evals.sh --out evals/results/new
```

Read the transcripts behind any failure before trusting the numbers. Put both pass counts, and any case that got worse, in the PR's Before / after section.

### 8. Commit and push

Stage all modified files explicitly by name. Commit with a message in the style of existing commits. Push with `-u origin release/vX.Y`.

### 9. Output the PR template and handoff

Fill `.github/PULL_REQUEST_TEMPLATE.md` and output it as a markdown code block, then say: "Open a PR from `release/vX.Y` into `main` on GitHub and paste the above as the PR description."

Fill the template as follows:

**What changed** — one paragraph: what changed and why, based on the user's description.

**Before / after** — if skill content changed, describe the relevant before/after behaviour. If infrastructure/docs only, write: "No skill output changes in this release." then briefly describe what changed in the files.

**Intensity levels tested** — if skill content changed, mark the relevant levels. If infrastructure/docs only, mark all three as `n/a, no skill changes`.

**Checklist** — mark all three as checked (`[x]`).

## After merge

The `on-merge` workflow creates the `vX.Y` tag and GitHub release (with `SKILL.md` and `pressure-test.zip` attached) and republishes the gist. Check that the release exists and has both files attached — the README's install links depend on them.

## Rules

- Always branch from a fresh `main`, never from another release or fix branch
- Never commit to main directly
- Every version reference must match — CI checks them, but fix any mismatch before committing
