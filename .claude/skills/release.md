---
name: release
description: Creates a new release of the Pressure Test skill. Handles branching from main, version bumps across all four files, CHANGELOG entry, commit, push, and outputs the filled PR template ready to paste into GitHub. Trigger with /release followed by a description of what changed and why.
---

# Release Skill

You are creating a new versioned release of the claude-pressure-test repo. The user has already made their changes locally. Your job is to handle everything from branching onwards.

## Before starting

If the user hasn't provided a description of what changed, ask for it before doing anything. You need it for the CHANGELOG entry and PR template.

Clarify whether the changes include:
- Skill content changes (SKILL.md / gist skill section) — affects Before/After in the PR template
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
grep "^version:" SKILL.md | sed 's/version: //'
```

Bump the minor version (e.g. `2.3` → `2.4`). This is the new version for this release.

### 4. Branch from main

```bash
git checkout main && git pull --rebase && git checkout -b release/vX.Y
git stash pop
```

### 5. Bump version in four places

Use the Edit tool (not sed) to update each precisely:

- `SKILL.md` frontmatter: `version: X.Y`
- `gist/claude-pressure-test.md` preamble: `**Version: X.Y**`
- `README.md`: `**Current version: vX.Y**`
- `README.md` curl URL: `…/vX.Y/SKILL.md`

### 6. Write CHANGELOG entry

Add at the top of `CHANGELOG.md` (after the header block, before the previous release). Use today's date. Format consistently with existing entries — `### Changed`, `### Added`, `### Fixed` sections as appropriate. Use the user's description to write the entries.

### 7. Commit and push

Stage all modified files explicitly by name. Commit with a message in the style of existing commits. Push with `-u origin release/vX.Y`.

### 8. Output the PR template and handoff

Output the following as a filled markdown code block, then say: "Open a PR from `release/vX.Y` into `main` on GitHub and paste the above as the PR description."

Fill the template as follows:

**What changed** — one paragraph: what changed and why, based on the user's description.

**Before / after** — if skill content changed, describe the relevant before/after behaviour. If infrastructure/docs only, write: "No skill output changes in this release." then briefly describe what changed in the files.

**Intensity levels tested** — if skill content changed, mark the relevant levels. If infrastructure/docs only, mark all three as `n/a, no skill changes`.

**Checklist** — mark all three as checked (`[x]`).

## Rules

- Always branch from a fresh `main`, never from another release or fix branch
- Never commit to main directly
- The four version locations must always match — if any are inconsistent, fix before committing
- SKILL.md and `gist/claude-pressure-test.md` skill content must stay in sync — if the user changed one, check the other
