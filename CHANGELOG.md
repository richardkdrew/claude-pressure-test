# Changelog

All notable changes to the Pressure Test skill are documented here.

---

## v2.4 — 2026-05-24

### Changed

- **Mirror step rebuilt** — instruction changed from "restate" to "reconstruct": name the best arguments supporting the idea even if the user didn't articulate them; after presenting the mirror, check in ("Does that capture it?") before proceeding to Blind Spots
- **Analogy Flip sharpened** — new instruction to identify the logical structure being mirrored (the relationship between elements, not the topic) before choosing a scenario; an analogy that works by surface association but not structural parallel will feel clever and land wrong
- **Counter-Punch rigor criterion added** — choose the argument that would most directly undermine the core claim, not just the most rhetorically credible objection; the archetype gives it voice, the logic gives it teeth
- **Trigger extended** — the command may now appear at the start or end of a message; context provided before or after the trigger is treated as part of the idea
- **Input format broadened** — example use cases updated to include philosophical positions, creative principles, personal decisions; "LinkedIn post draft" removed as a first-class example
- **Example runs updated** — all four persona examples regenerated to reflect updated skill behaviour; new analogies (Michelin star kitchen, IBM Global Services, coal preparation workers, radiology) and new counter-punch archetypes across the runs
- **Workflow hardened** — `curl --fail` added to gist publish step; `workflow_dispatch` trigger added; gist ID moved to job-level env var
- **Version consistency CI check** — new `version-check.yml` workflow verifies version sync across SKILL.md, README, gist, and CHANGELOG on every PR to main

---

## v2.3 — 2026-05-24

### Added

- **Release automation** — `on-merge` workflow now automatically publishes the gist and creates the GitHub release and tag on every merge to main; no manual web UI steps required
- **PR template guidance** — CLAUDE.md documents how to fill the PR template for release and infrastructure branches

### Changed

- **Release checklist simplified** — CLAUDE.md and CONTRIBUTING.md updated to reflect automation; manual steps reduced to version bumps, CHANGELOG, and PR

---

## v2.2 — 2026-05-24

### Changed

- **Sharing prompt in gist** — one-line prompt added after setup instructions so users know to forward the gist link to colleagues
- **README sharing guidance** — explicit note for technical users to send the gist link (not the GitHub repo) when sharing with non-technical colleagues

---

## v2.1 — 2026-05-24

### Changed

- **Counter-Punch archetype guidance** — added explicit instruction to choose the archetype for structural difference, not seniority; the most useful friction comes from someone whose interests or vantage point are orthogonal to the user's, not a more senior version of them
- **Gist preamble rewritten** — clearer entry point for first-time visitors; surfaces version number, adds 90-second setup framing
- **Versioned install path** — README Option B curl command now points to a tagged release rather than `main`; includes version check one-liner
- **Intensity guidance** — README now steers users toward `medium` for short punchy takes where the full scorecard table adds distance instead of sharpness

### Fixed

- **Gist markdownlint config** — brought in line with root config to suppress false positives on long prose lines throughout the skill content

---

## v2 — 2026-05-16

### Added

- **Optionality parameter** — `/pt [intensity] optionality: on` unlocks an Optional Stretch section in the Verdict Card, surfacing three named alternative paths forward
- **Optional Stretch format** — each approach uses a consistent `[Approach Name] — content` format with 2–3 sentences: the first describes the path, the second surfaces what makes it distinctively valuable or what it reveals that the others don't

### Changed

- **Verdict Card rebuilt** — scorecard is now a dynamic dimension table rather than a fixed list; Core Insight is always first, Biggest Risk is always last, middle rows are drawn from the specific idea being tested
- **Quick Fix and Structural Move** are now explicit section headers in the Verdict Card, making the three moves more scannable
- **Blind spots numbered** — full-intensity blind spots are now explicitly numbered so they're easier to reference and respond to
- **Formatting consistency** — tightened formatting rules throughout to reduce output variance across runs

---

## v1 — initial release

### Added

- Five-move structure: Mirror, Blind Spots, Counter-Punch, Analogy Flip, Verdict Card
- Three intensity levels: `light`, `medium`, `full` — with `full` as the default
- Trigger commands: `/pressure-test` and `/pt`
- Tone guidelines: sparring partner framing, energy-matching, no opening praise
- Post-session check-in to open dialogue on pushback, intensity adjustment, or continuation
- Explicit "What This Skill Is NOT" guardrails
