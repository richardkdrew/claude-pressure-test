---
name: fix
description: Creates a fix branch for a small correction that doesn't warrant a version bump — typos, missing URLs, doc corrections, gist preamble tweaks. No version bump, no CHANGELOG entry. Handles branching from main, commit, push, and outputs the filled PR template ready to paste into GitHub. Trigger with /fix followed by a short description of what was fixed.
---

# Fix Skill

You are creating a fix branch for a small correction in the claude-pressure-test repo. The user has already made their changes locally. No version bump. No CHANGELOG entry. The on-merge workflow will auto-publish the gist if `gist/claude-pressure-test.md` changed, and will skip release creation since the version hasn't changed.

## Before starting

If the user hasn't provided a short description of what was fixed, ask before doing anything. You need it for the branch name, commit message, and PR template.

## Steps

### 1. Capture and stash current changes

```bash
git status
git stash
```

Note which files were modified — you'll need this for the commit.

### 2. Branch from main

```bash
git checkout main && git pull --rebase && git checkout -b fix/short-description
git stash pop
```

Use a short kebab-case description for the branch name derived from what the user told you (e.g. `fix/gist-sharing-url`, `fix/readme-typo`).

### 3. Commit and push

Stage only the files that were changed. Commit with a clear one-line message describing what was fixed. Push with `-u origin fix/short-description`.

### 4. Output the PR template and handoff

Output the following as a filled markdown code block, then say: "Open a PR from `fix/short-description` into `main` on GitHub and paste the above as the PR description."

Fill the template as follows:

**What changed** — one paragraph: what the bug was and what the fix does.

**Before / after** — show the specific text or behaviour before and after. Keep it short and concrete.

**Intensity levels tested** — mark all three as `n/a, no skill changes`.

**Checklist** — mark all three as checked (`[x]`).

## Rules

- Always branch from a fresh `main`, never from a release or another fix branch
- Never commit to main directly
- No version bumps — if the fix warrants a version bump, use `/release` instead
- No CHANGELOG entry — fixes are covered by the automated release notes
