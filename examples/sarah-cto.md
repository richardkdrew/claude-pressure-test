# Sarah — CTO, Series B SaaS

## Contents

- [Persona](#persona)
- [The Challenge](#the-challenge)
- [Run: `/pt light`](#run-pt-light)
- [Run: `/pt full`](#run-pt-full)

---

## Persona

Sarah is CTO at a B2B SaaS company that has just crossed $10M ARR with 130 employees. The engineering team grew from 8 to 35 in 18 months off the back of a Series B. The monolith that got them here is showing strain — deploys take 40 minutes, every team steps on every other team, and the two senior engineers who understand the core are now a bus risk. The board has approved a growth plan targeting $50M ARR in three years. The business wants to ship faster. The architecture needs the opposite of that right now.

## The Challenge

Whether to pause feature development for a quarter to modularise the platform — accepting short-term velocity cost to avoid a larger, less controllable structural failure later.

**The idea Sarah is testing:** *"We should pause feature development for a quarter and modularise the platform — if we don't, the next year of growth will break us."*

---

## Run: `/pt light`

> `/pt light We should pause feature development for a quarter and modularise the platform — if we don't, the next year of growth will break us.`

---

### Mirror

The argument is straightforward: the current architecture is a ceiling, not just a floor. Another year of shipping features on top of it will compound the structural problems to the point where they become a growth blocker — and the cost of fixing it later will be significantly higher than the cost of pausing now. Better to take the pain on your terms than have it forced on you mid-sprint.

### Blind Spots

- How confident are you that the board and CEO will hold the line for a full quarter with nothing shipping? The decision to pause might be technically sound but politically unsellable — especially post-Series B when investors are watching for velocity signals.
- Is "modularise the platform" actually a defined, scoped project, or a direction? A quarter is short; if the work isn't already well-understood, you may end up in a worse position: behind on features *and* with an incomplete refactor.

### Analogy Flip

Worth considering: is this more like a car service (planned downtime, predictable outcome) or more like open-heart surgery while the patient is still running marathons? The framing of "pause" assumes the rest of the business will pause with you.

### Verdict Card

The core logic is sound and the instinct is right — architectural debt does compound, and addressing it proactively is usually cheaper than reactively. The thing to sharpen: "pause feature development for a quarter" is a strategy, not a plan. Before you make the case, have the scope, the team, and the exit criteria defined — otherwise you're asking stakeholders to accept the cost without being able to price the benefit.

---

*How did that land?*

---

## Run: `/pt full`

> `/pt full We should pause feature development for a quarter and modularise the platform — if we don't, the next year of growth will break us.`

---

### Mirror

Your argument is this: the monolith architecture that got the company to $10M ARR is now a liability, not an asset. Continued feature development on top of it isn't neutral — it's actively making the architectural problem worse, increasing coupling and making eventual remediation harder and more expensive. The rational move is to accept a short-term cost (one quarter of reduced feature velocity) to avoid a larger, less controllable cost later — the platform failing under the load of the growth you're planning for.

This assumes three things: that the architectural problem is real and well-understood, that a quarter is a credible timeframe for meaningful modularisation, and that the business can absorb the pause without serious commercial consequence.

### Blind Spots

1. **The pause is rarely actually a pause.** Production systems don't stop breaking during a refactor quarter. You'll still be triaging incidents, shipping hotfixes, and handling customer escalations. The engineering team will be splitting attention, not fully focused — which means both the modularisation and the firefighting will be done at lower quality than you're planning for.
2. **"Modularise the platform" may not be a quarter of work.** What does done look like? What's the smallest useful increment? Without tight answers to these, you risk the worst outcome: a quarter spent, partial work shipped, and pressure to resume features before the architecture work is actually stable.
3. **You may be optimising for the wrong bottleneck.** Is the platform actually the constraint on your ability to hit Series B targets, or is it one of several? If sales, onboarding, or customer success are equally constraining, a quarter of engineering focus on platform might not move the number the board cares about.
4. **The political cost of the pause may outlast its duration.** A quarter of reduced feature velocity creates a story. Investors talk to customers. Customers notice when the roadmap stalls. The business case for pausing needs to explicitly address what you'll say externally — not just what you'll do internally.

### Counter-Punch

Here's what a sharp Series B board member who's seen this pattern before would say back:

*"I've heard this argument at every company I've invested in. Every CTO, at every inflection point, wants to stop the car and fix the engine. And every time, it takes longer than planned, costs more than expected, and the commercial momentum you thought you'd protect is harder to rebuild than you expected. The question isn't whether the architecture needs work — it clearly does. The question is whether a hard stop is the only way to do it, or whether you're reaching for a clean solution to a messy problem because the messy approach — incremental modularisation alongside feature work — feels harder to manage. The monolith got you to $10M. Have you actually proven it can't get you to $20M?"*

### Analogy Flip

Think about a restaurant that decides to redesign the kitchen mid-service. The kitchen clearly needs the upgrade — it's too small, the layout is wrong, and the chefs are constantly in each other's way. The right time to redesign was before the restaurant got popular. But the restaurant *is* popular now, and popular restaurants don't close for a quarter. The ones that get it right figure out how to move the prep station while still getting food to the tables. The ones that close for a quarter often find that a competitor picked up their regulars while they were gone.

### Verdict Card

| Dimension | Assessment |
| --------- | ---------- |
| Core Insight | Sound — architectural debt at this stage does compound, and the proactive instinct is right |
| Urgency Calibration | Weak — "will break us" is asserted, not demonstrated; the case needs evidence, not conviction |
| Scope Clarity | Weak — "modularise the platform" is a direction, not a project; without defined scope the timeline is fiction |
| Commercial Risk | Underweighted — the Series B context means stakeholder trust is fragile; the pause has political cost beyond the quarter |
| Biggest Risk | Starting the pause without a tight scope definition and exiting with incomplete work and a damaged credibility narrative |

**Quick Fix** — Before you pitch the pause, define what "done" looks like in concrete, testable terms. Not "we've broken up the monolith" — what can the team do in week 13 that they couldn't do in week 1? If you can't answer that, the scope isn't ready.

**Structural Move** — Reframe the decision from "pause vs. don't pause" to "what's the smallest modularisation increment that meaningfully reduces risk, and can we do it as a parallel track rather than a full stop?" That question is more answerable, more sellable, and more likely to actually ship.

---

*How did that land?*
