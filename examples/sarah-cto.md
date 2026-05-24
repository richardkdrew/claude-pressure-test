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

You're saying the debt isn't just slowing you down — it's structural, and the window to address it on your terms is closing. Forty-minute deploys and two people holding the keys to the core aren't inconveniences; they're compounding risks that get harder to unwind as the team and codebase grow. A quarter of deliberate pain now buys you the foundation the $50M plan actually requires. Does that capture it?

### Blind Spots

- Who owns the roadmap during the pause? If the answer is "nobody," a quarter of silence from engineering creates a sales and leadership vacuum that may be harder to recover from than the technical debt itself.
- "Modularise the platform" can mean very different things to 35 engineers. Without a tight definition of done, the quarter ends and you're somewhere in the middle — slower, messier, and no cleaner than when you started.

### Analogy Flip

A city that keeps issuing building permits on top of an aging water main because digging up the street will cause traffic disruption. Every month of permits is another stakeholder who'll be angry when work finally starts — and eventually the main fails on its own schedule, during peak hours, with no preparation time. The disruption you're avoiding now becomes the crisis you're managing later, on worse terms.

### Verdict Card

The underlying logic is sound: bounded pain now versus unbounded pain later is usually the right trade, and your signals — deploys, bus risk, team stepping on each other — suggest you're closer to the unbounded scenario than the business realises. The thing to sharpen: a "pause" framed to the board as a quarter of nothing will face constant pressure to end early. It needs a shipping narrative — what gets demonstrably better, and when.

---

*How did that land?*

---

## Run: `/pt full`

> `/pt full We should pause feature development for a quarter and modularise the platform — if we don't, the next year of growth will break us.`

---

### Mirror

You're making a structural argument, not just a technical one. The monolith isn't a performance problem — it's an organisational constraint. Thirty-five engineers operating on a shared codebase where two people hold the mental model means your actual delivery capacity is capped well below what the headcount implies. Every new feature gets slower to ship, not faster, because the coupling tax compounds. The 40-minute deploy is a symptom; the cause is that the system was designed for a team of eight making fast, co-ordinated decisions, and that team no longer exists.

The load-bearing assumption underneath your proposal: the cost of a controlled pause now — one quarter, scoped, on your terms — is less than the cost of an uncontrolled crisis later, when failure happens during a critical sales cycle or after you've hired another twenty engineers into the same broken system. You're not asking for permission to go slow. You're arguing that going slow now is the only way to go fast on the timeline the board actually cares about.

Does that capture it?

### Blind Spots

1. **The pause will not stay paused.** A quarter with no features shipping creates a power vacuum. Sales will escalate. The CEO will get pulled into customer calls. By week six, someone senior will approve "just one critical fix" and the modularisation work will fracture into a half-done hybrid that's worse than the monolith. The plan needs an explicit decision-making protocol for exceptions — not an assumption they won't happen.

2. **"Modularise" is not a definition of done.** Thirty-five engineers will have thirty-five mental models of what that means. Without a precise target state — specific seams, specific contracts, specific metrics — the quarter ends mid-migration. You trade a stable monolith for an unstable in-between state, and the next quarter of features ships on top of that.

3. **The two senior engineers who hold the mental model are your critical path.** Modularisation work requires that knowledge to be externalised first — documentation, pairing, recorded sessions. If you start cutting seams before the knowledge is safe, you increase the bus risk during the most vulnerable period.

4. **The board approved a growth plan, not a pause.** They're measuring you on the $50M trajectory. A quarter of no visible output will feel like a broken promise unless you have a concrete story about what "faster" looks like in Q2 and what "breaking" would have looked like if you hadn't done this. You need the before/after case ready before you're asked for it.

### Counter-Punch

Here's what the VP of Sales who just closed your two largest enterprise deals would say back:

*"I hear the architecture argument, and maybe it's right. But you're asking me to go dark on our top prospects for ninety days while our main competitor ships every two weeks. We just hit $10M — this is exactly when customers are watching to see if we're real. Every quarter we don't ship is a quarter we tell the market we're in maintenance mode. We lose two of those enterprise deals and the board isn't talking about $50M anymore. Technical debt is a real problem. Losing the growth moment is a different kind of structural failure — and it doesn't come with a roadmap out."*

### Analogy Flip

A mining company discovers early survey data suggesting a primary shaft has a slow fracture developing — manageable now with a two-week closure and controlled reinforcement, but likely catastrophic in six to eighteen months if left. Management delays the closure because the shaft is currently at peak output and a two-week shutdown costs $4M. Eighteen months later the fracture propagates during maximum load. The shaft is condemned, the closure is now six months instead of two weeks, and the total cost is twelve times the original estimate — plus an inquiry, plus the reputational hit with insurers. The fracture didn't wait for a convenient moment. It just got bigger until it picked its own.

The structure is identical to yours: a bounded, painful intervention now versus an unbounded, uncontrolled failure later. The mining case adds one element worth sitting with — the people who delayed the closure had strong incentives and seemingly good reasons. So do your board and your VP of Sales. That doesn't make them wrong to push back. It means the argument you need to win isn't technical. It's about who controls the timing.

### Verdict Card

| Dimension | Assessment |
| --- | --- |
| Core Insight | The system was designed for a team of 8; you're running 35 through it. The mismatch is the problem, and it compounds with every hire. |
| Logic of the Trade | Bounded pain now vs. unbounded failure later is the right frame. Your signals — deploys, bus risk, cross-team collisions — suggest later is closer than it looks. |
| Organisational Risk | The pause will face constant pressure to end early. Without a decision protocol for exceptions, it fractures into a half-done migration that's harder to complete than the original monolith. |
| Knowledge Risk | The two engineers who hold the core are your critical path. Externalising that knowledge isn't a nice-to-have before modularisation — it's a prerequisite. |
| Stakeholder Risk | The board approved growth, not a pause. You need a concrete before/after narrative and a Q2 velocity story ready before you're challenged, not after. |
| Biggest Risk | "Modularise the platform" without a precise definition of done. The quarter ends mid-migration and you ship the next year's features on top of an unstable in-between state. |

**Quick Fix** — Define done before you start. Pick three specific seams, three measurable outcomes (deploy time, independent release capability, on-call load), and a weekly check-in format that makes progress visible to non-engineers. The pause needs a shipping narrative even if it's not shipping features.

**Structural Move** — Reframe the proposal to the board as a capacity investment with a concrete payoff date, not a pause. "In Q3 we ship features at half velocity while we restructure. In Q4, each of our five product teams deploys independently. Here's what that unlocks for the $50M plan." That's a different conversation than asking permission to stop.

---

*How did that land?*
