#!/bin/sh
# Build distribution files from SKILL.md into dist/:
#   pressure-test-skill.md  skill body without frontmatter (gist, claude.ai Project instructions)
#   pressure-test.zip       pressure-test/SKILL.md folder (claude.ai skill upload)
#   SKILL.md                copy for the latest-release download URL (Claude Code)
set -e
rm -rf dist && mkdir -p dist/pressure-test
sed -n '/^# Pressure Test$/,$p' SKILL.md > dist/pressure-test-skill.md
[ -s dist/pressure-test-skill.md ] || { echo "No '# Pressure Test' heading in SKILL.md" >&2; exit 1; }
cp SKILL.md dist/SKILL.md
cp SKILL.md dist/pressure-test/SKILL.md
(cd dist && zip -qr pressure-test.zip pressure-test)
