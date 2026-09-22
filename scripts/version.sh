#!/bin/sh
# Print the skill version from SKILL.md frontmatter (metadata.version).
# Also reads the pre-v2.6 top-level `version:` key so CI can compare against older bases.
sed -n 's/^[[:space:]]*version:[[:space:]]*"\{0,1\}\([0-9][0-9.]*\)"\{0,1\}[[:space:]]*$/\1/p' "${1:-SKILL.md}" | head -1
