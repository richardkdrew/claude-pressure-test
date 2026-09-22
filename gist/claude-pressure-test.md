# Pressure Test

A thinking sparring partner for Claude. Strengthens ideas through genuine challenge — five structured moves: Mirror, Blind Spots, Counter-Punch, Analogy Flip, Verdict Card. **Triggers:** `/pt` or `/pressure-test` followed by your idea.

**Version: 2.6** · [Full repo and examples](https://github.com/richardkdrew/claude-pressure-test)

---

## Set it up (90 seconds)

The skill itself is the second file in this gist, **pressure-test-skill.md**, below this guide.

**Option 1 — Skill upload** (recommended on paid plans; works in every chat)

1. Download [pressure-test.zip](https://github.com/richardkdrew/claude-pressure-test/releases/latest/download/pressure-test.zip)
2. In Claude, open **Settings → Capabilities**, find **Skills**, and upload the zip
3. In any chat, type `/pt` followed by your idea

If you don't see Skills in your settings, use Option 2.

**Option 2 — Project** (works on any plan; only inside that Project)

1. Open the [skill file](https://gist.githubusercontent.com/richardkdrew/c062631fdfee41fac10e815973576407/raw/pressure-test-skill.md), select all, and copy
2. In Claude, open or create a Project
3. Paste into the project's **Instructions** and save
4. Every conversation in that Project will have `/pt` available

**Option 3 — One-off**

1. Open the [skill file](https://gist.githubusercontent.com/richardkdrew/c062631fdfee41fac10e815973576407/raw/pressure-test-skill.md), select all, and copy
2. Paste it at the start of any Claude conversation
3. Type `/pt` followed by your idea

**To update:** repeat the same steps — the links above always point to the latest version.

**Want to share this?** Forward this gist link to a colleague — the setup instructions above are all they need:
<https://gist.github.com/richardkdrew/c062631fdfee41fac10e815973576407>

## Quick example

```text
/pt full We should pause feature development for a quarter to fix our architecture
```

At `full`, Claude first checks it has understood your idea, then waits for you before challenging it. Use `/pt medium` for a quicker, single-response run.
