#!/usr/bin/env bash
# Regenerate the Cursor + Codex adapters from the canonical agent/breachproof.md.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$ROOT/agent/breachproof.md"
# Strip the YAML frontmatter (the first two '---' delimiters and everything
# before/between them) plus any leading blank lines, then emit the body verbatim
# so in-body '---' section separators are preserved.
BODY="$(awk 'fm<2{if($0=="---")fm++;next} fm==2&&!started&&$0==""{next} {started=1;print}' "$SRC")"
mkdir -p "$ROOT/adapters/cursor" "$ROOT/adapters/codex"
{ printf -- '---\ndescription: Breachproof - autonomous AI security audit + auto-fix until zero findings remain.\nglobs:\nalwaysApply: false\n---\n\n'; printf '%s\n' "$BODY"; } > "$ROOT/adapters/cursor/breachproof.mdc"
printf '%s\n' "$BODY" > "$ROOT/adapters/codex/breachproof.md"
echo "regenerated adapters from agent/breachproof.md"
