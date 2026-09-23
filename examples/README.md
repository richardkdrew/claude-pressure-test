# Example Runs

Four business personas, real problems, multiple intensity levels. Use these to understand what Pressure Test output looks like before you run your own.

| Persona | Role | Runs |
| --------- | ------ | ------ |
| [Sarah](sarah-cto.md) | CTO, Series B SaaS | [light](sarah-cto.md#run-pressure-test-light) · [full, correcting the Mirror](sarah-cto.md#run-pressure-test-full--correcting-the-mirror) · [default, a sound idea](sarah-cto.md#run-pressure-test--a-sound-idea-at-the-default-intensity) |
| [Marcus](marcus-strategy.md) | Head of Strategy, Regional Bank | [medium](marcus-strategy.md#run-pressure-test-medium) · [full + optionality, with pushback](marcus-strategy.md#run-pressure-test-full-optionality-on--with-pushback) |
| [Priya](priya-cro.md) | CRO, Professional Services Firm | [light](priya-cro.md#run-pressure-test-light) · [full](priya-cro.md#run-pressure-test-full) |
| [Alex](alex-ceo.md) | CEO, Professional Services Firm | [full](alex-ceo.md#run-pressure-test-full) · [full + optionality](alex-ceo.md#run-pressure-test-full-optionality-on) |

## How these were made

- **Skill version:** v2.7, pasted in as instructions (the claude.ai Project setup), run on Claude Sonnet with no other instructions, plugins, or memory.
- **Context:** each persona's background was pasted into the conversation before the command. That's why the output can reference specifics like team size or balance sheet — give it the same context and you'll get the same depth.
- **Editing:** headings are normalised for readability (for example `**Blind spots**` becomes `### Blind Spots`). The content is unedited.
- **What's shown:** at `full`, Claude stops after the Mirror and waits for a reply; every full run shows that exchange. Sarah's full run shows a *correction* to the Mirror, and Marcus's shows a pushback after the Verdict, including what Claude concedes and what it holds.
- **What was replaced:** one Marcus medium run cited real acquisitions (Jet.com, Dollar Shave Club) with claims about founder departures that weren't accurate. It was discarded and regenerated rather than edited. The skill's grounding rule makes this rarer, not impossible — check any real-world case before repeating it.
