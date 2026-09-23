# Sarah — CTO, Series B SaaS

## Contents

- [Persona](#persona)
- [The Challenge](#the-challenge)
- [Run: `/pressure-test light`](#run-pressure-test-light)
- [Run: `/pressure-test full` — correcting the Mirror](#run-pressure-test-full--correcting-the-mirror)
- [Run: `/pressure-test` — a sound idea at the default intensity](#run-pressure-test--a-sound-idea-at-the-default-intensity)

---

## Persona

Sarah is CTO at a B2B SaaS company that has just crossed $10M ARR with 130 employees. The engineering team grew from 8 to 35 in 18 months off the back of a Series B. The monolith that got them here is showing strain — deploys take 40 minutes, every team steps on every other team, and the two senior engineers who understand the core are now a bus risk. The board has approved a growth plan targeting $50M ARR in three years. The business wants to ship faster. The architecture needs the opposite of that right now.

## The Challenge

Whether to pause feature development for a quarter to modularise the platform — accepting short-term velocity cost to avoid a larger, less controllable structural failure later.

**The idea Sarah is testing:** *"We should pause feature development for a quarter and modularise the platform — if we don't, the next year of growth will break us."*

---

## Run: `/pressure-test light`

> `/pressure-test light We should pause feature development for a quarter and modularise the platform — if we don't, the next year of growth will break us.`
>
> *Context: the Persona section above was pasted into the conversation before this command.*

---

**Mirror:** The monolith isn't just a tech debt problem, it's an organizational one — 35 engineers can't move independently inside one codebase, 40-minute deploys throttle everyone's iteration speed, and two people holding the core in their heads is a continuity risk the board would care about if they understood it. Modularizing now, before the $50M push scales the pain further, is a bet that a deliberate quarter-long pause is cheaper than compounding chaos. If I've misread you, say so and I'll rerun from here.

### Blind Spots

- Can all 35 engineers actually be usefully deployed on modularization, or does the real bottleneck work concentrate on those same 2 senior engineers — meaning a full-team freeze halts revenue output without proportionally speeding up the fix?
- Does it have to be binary? Would a strangler-fig approach (extract one module at a time while shipping reduced-but-nonzero features) get most of the risk reduction without the harder sell of "zero features for a quarter" to a board that just funded a growth plan?

**Analogy flip:** It's a bit like grounding your whole fleet for a quarter to overhaul the engines — when the actual problem is that only two mechanics understand how the engines work. You might get more value pulling planes out of rotation one at a time than stopping the airline.

**Verdict:** The diagnosis is sound — bus factor and deploy time are real, worsening risks. The weak point is the "full stop, all hands" framing — check whether the bottleneck is engineer-hours or tribal-knowledge-hours before freezing 35 people's output on it.

*How did that land?*

---

## Run: `/pressure-test full` — correcting the Mirror

> `/pressure-test full We should pause feature development for a quarter and modularise the platform — if we don't, the next year of growth will break us.`
>
> *Context: the Persona section above was pasted into the conversation before this command.*

---

### Mirror

Here's the strongest version of what you're proposing: the monolith isn't just annoying anymore, it's become a load-bearing constraint on the business — 40-minute deploys are a tax on every team, cross-team collisions are eating velocity that should be *increasing* as headcount grows, and two people carry enough tribal knowledge that losing either one is an existential engineering event, not a staffing hiccup. Your read is that this isn't a "nice to have someday" problem — it's a problem with a growth curve of its own, and the growth curve for pain is steeper than the growth curve for revenue. If the board's plan is 5x ARR in three years, and the org roughly doubles again to support that, the current architecture doesn't degrade linearly — it seizes. So you'd rather take a deliberate, bounded hit now (one quarter, zero new features, full team on modularization) than an unplanned, unbounded hit later (an outage during a launch, a senior engineer leaving mid-crisis, a quarter of *negative* velocity because nothing can ship safely).

The case for a hard stop specifically — rather than a slower parallel effort — rests on a few things you probably believe even if you didn't say them outright:

- Modularization done alongside full feature velocity gets starved of attention and never actually finishes — "20% time" architecture work is where good intentions go to die.
- Three months is a large enough block of focused work to get through the highest-value seams (the ones causing the deploy bottleneck and the team collisions), even if the whole platform isn't "done."
- The two senior engineers are more useful *directing* a concentrated effort than being interrupted piecemeal by 33 other engineers shipping features around them.
- A short, sharp, well-communicated pause is less damaging to the business than the credibility hit of missing commitments later because the platform couldn't support the team trying to hit them.
- The board, having just approved a growth plan, would rather hear "we're derisking the engine now" than discover the engine can't handle the load a year from now.

Does that capture it — particularly the bet that a full stop beats a parallel-track effort, and that three months is the right unit of time for this? If I've misread you, say so and I'll rerun from here.

*Claude waits for a reply.*

> **Sarah:** Close, but not the whole platform — I mean the billing and permissions core. That's where every team collides and where the two senior engineers are the only ones who can make changes. The rest of the monolith can wait.

Good — that's a materially different, sharper idea. Locking that in: pause feature work for a quarter to let the two senior engineers (plus whoever else is needed) decouple billing and permissions from the monolith, because that's the specific seam where every team collides and where only two people can safely touch the code. Let's run the rest of the round against *that* version.

### Blind Spots

1. **The fix is narrow; the pause as stated isn't.** If the actual problem is contained to billing and permissions, why does "pause feature development" apply to all 35 engineers? Either most feature work in this product genuinely routes through billing/permissions (plan tiers, entitlements, usage metering, role-based access — plausible in B2B SaaS), in which case the freeze is more justified than it sounds but you should say *that* explicitly, not "we're pausing to fix architecture." Or it doesn't, in which case you're benching 25+ people who have nothing to do with the bottleneck, and the real ask is a scoped freeze on a subset of teams plus focused headcount on the seam — a much smaller, easier sell to the board than "the whole eng org stops."

2. **You're concentrating the bus-factor risk right before betting on it.** The two engineers who are single points of failure for billing/permissions are also the only ones who can lead the work to fix that. For a quarter, your two highest-risk people become *more* critical, not less — they're now the bottleneck for the modularization itself, still fielding whatever billing/permissions fires happen to come up, and if either one leaves, gets sick, or burns out in month two, you don't have a working freeze *or* a working migration — you have a half-decomposed billing system and no one left who understands either the old or the new version well enough to finish it.

3. **This is the worst place in the codebase to be wrong under time pressure.** Billing errors are revenue recognition and customer-trust problems; permissions errors are access-control problems — in B2B SaaS, a permissions regression means one customer's data leaking into another customer's view, which is a security-incident and possibly a contract- and compliance-ending event. A fixed 90-day clock is a schedule pressure, and schedule pressure on the two subsystems with zero tolerance for "mostly correct" is a specific, dangerous combination — the same pressure that produces exactly the kind of bug you're trying to prevent.

### Counter-Punch

Here's what an enterprise customer's security lead — the person who signed off on your SOC 2 report before renewing — would say if they knew what you were planning:

*"You want to rewrite the system that decides who can see whose data, over one quarter, using the same two engineers who are apparently already the only people who understand it well enough to touch it safely today? That's not derisking, that's a single 90-day change window on the one system where I have zero appetite for surprises. What's the rollback if week eleven you're not done — do you ship a half-migrated permissions model into prod because the calendar ran out? I don't care that it's scoped. I care that 'scoped and rushed' is exactly how access-control bugs happen."*

### Analogy Flip

Picture a bank that decides its vault's locking mechanism and its ledger are both showing strain as branch volume grows — reasonable, those are the two systems where every teller collides. So it assigns the job to the two original locksmiths (the only ones who understand the current mechanism), gives them 90 days, and keeps the vault open for business the whole time. Nobody runs a bank this way. Core banking and access-control migrations run the *new* system in parallel with the old one — shadow mode, dual-write, reconciliation — for as long as it takes the two systems to agree on every transaction, because the exit criterion is "we've proven it's correct," not "the quarter is over." The calendar isn't the thing that should tell you you're done; agreement between old and new, verified in production traffic, is. A timebox on this specific pair of systems isn't discipline, it's picking the wrong instrument for the risk you're trying to manage.

### Verdict Card

| Dimension | Assessment |
| --- | --- |
| **Core Insight** | Right instinct to scope this to billing/permissions specifically — that's a real, well-identified seam, not a vague "the monolith is bad" complaint. |
| **Scope Discipline** | Good in principle, undermined if "pause feature development" still means all 35 engineers rather than the teams actually touching this seam. |
| **Resourcing Mismatch** | A narrow technical target justifies a narrow freeze, not an org-wide one — unless you can show most roadmap work genuinely depends on this code. |
| **Bus-Factor Paradox** | The plan asks your two highest-risk people to carry the riskiest 90 days of their tenure, with no stated fallback if either becomes unavailable mid-migration. |
| **Exit Criteria** | "One quarter" is a calendar commitment on a correctness problem — the two don't naturally align, especially on billing and access control. |
| **Biggest Risk** | Not that the quarter runs long — it's that it runs *out* before verification is done, and the choice becomes ship an unverified permissions/billing model or extend indefinitely, either of which costs more than the original problem. |

**Quick Fix**
Rewrite the ask before it goes to the board or the team: name the specific teams whose feature work actually touches billing/permissions and freeze only those, explicitly. Everyone else keeps shipping. This alone kills most of the credibility risk of "CTO paused the roadmap" without changing the technical plan at all.

**Structural Move**
Replace the calendar-based exit condition with a verification-based one, and make bus-factor reduction a required deliverable, not a side effect. Concretely: stand up the new modular billing/permissions path in shadow mode against the monolith for all production traffic, and don't call the migration done until outputs match on a defined threshold (e.g., 100% agreement over N consecutive days across all customers, or a defined tolerance with reconciliation) — *and* until at least one additional engineer per subsystem can independently make and ship a change without either of the two seniors in the loop. If either exit condition isn't met at the 90-day mark, that's the signal to extend or change approach — not the calendar running out.

*How did that land?*

---

## Run: `/pressure-test` — a sound idea at the default intensity

> `/pressure-test We should start running a full restore test of our production database backups every month. We take nightly backups but we've never actually restored one.`
>
> *Context: the Persona section above was pasted into the conversation before this command.*

---

### Mirror

You're saying: an untested backup isn't a backup, it's a hope. Right now you're one bad migration, one silent replication bug, or one ransomware event away from discovering — at the worst possible moment — that your recovery path doesn't actually work. A monthly restore test converts that assumption into a verified capability, and relative to the size of the risk it's protecting against (total data loss, at a company the board just funded to 5x), it's cheap.

Baked into that are a few claims: that monthly is the right cadence to catch backup drift before it matters, that a "full" restore is the right fidelity of test, and that the team has the bandwidth to absorb this now. If I've misread any of that, say so and I'll rerun from here.

### Blind Spots

1. **Who actually runs it?** If the restore procedure lives in the heads of your two senior engineers, a monthly drill doesn't reduce your bus risk — it adds a recurring obligation to your two highest-risk people. You could run this test every month for a year and still lose everything the day one of them leaves.
2. **Opportunity cost, right now.** Senior engineering time is your binding constraint this quarter — it's the thing standing between you and fixing 40-minute deploys and teams stepping on each other. A manual monthly ritual competes directly with that, and "manual monthly ritual" is exactly the kind of task that gets quietly skipped the first time a deadline bites.
3. **"Full" and "monthly" are undefined.** Vague scope is how good intentions become theater — the test either balloons into a costly production-scale exercise nobody has time for, or gets scoped down over time until it's checking something trivial.

### Counter-Punch

An SRE who's done this at scale before would say: *"A monthly restore test run by hand is a fire drill, not infrastructure. What breaks companies isn't the absence of a drill — it's that the drill depends on two people's tribal knowledge and a calendar reminder. Script the restore, checksum the result, cron it weekly against a scratch instance, and page someone if it fails. That's not a monthly ceremony you might skip — it's a fact about your system that's true every day."*

### Analogy Flip

This is a fire drill where the only two people certified to use the extinguisher are the ones leading it. Everyone else in the building still doesn't know where it is or how it works. The point of a drill isn't just "does the extinguisher work" — it's "does someone other than the two most at-risk people know how to use it."

### Verdict Card

The instinct is correct and overdue — untested backups at this stage of company is genuine tail risk, not paranoia. The weakness is mechanism: as scoped, it's manual, undefined in size, and likely re-concentrates risk in the same two people instead of spreading it. **Move it from a human ritual to an automated, scripted restore-and-verify job** that anyone can run from a runbook — that gets you the safety without spending your scarcest resource on a recurring chore.

*How did that land?*
