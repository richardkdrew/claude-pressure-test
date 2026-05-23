# Changelog

All notable changes to the Pressure Test skill are documented here.

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
