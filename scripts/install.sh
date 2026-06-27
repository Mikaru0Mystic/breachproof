#!/usr/bin/env bash
# Breachproof installer — installs the agent + /breachproof command into opencode
# and pulls the Sectinel arsenal. Idempotent.
set -euo pipefail

CFG="${OPENCODE_CONFIG_DIR:-$HOME/.config/opencode}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "🛡️  Installing Breachproof…"
mkdir -p "$CFG/agent" "$CFG/command"
cp "$ROOT/agent/breachproof.md"   "$CFG/agent/breachproof.md"
cp "$ROOT/command/breachproof.md" "$CFG/command/breachproof.md"
echo "  ✓ agent      -> $CFG/agent/breachproof.md"
echo "  ✓ command    -> $CFG/command/breachproof.md  (/breachproof)"

# Claude Code compatibility (agents live under ~/.claude/agents)
if [ -d "$HOME/.claude" ]; then
  mkdir -p "$HOME/.claude/agents"
  cp "$ROOT/agent/breachproof.md" "$HOME/.claude/agents/breachproof.md"
  echo "  ✓ claude     -> ~/.claude/agents/breachproof.md"
fi

# Sectinel arsenal (784 skills + MCP wiring + scanner integrations)
if [ -d "$CFG/cybersec-arsenal" ]; then
  echo "  ✓ arsenal    -> Sectinel already present ($CFG/cybersec-arsenal)"
else
  echo "  → installing the Sectinel arsenal…"
  if command -v git >/dev/null 2>&1; then
    tmp="$(mktemp -d)"
    if git clone --depth 1 https://github.com/PockySweet/sectinel.git "$tmp/sectinel" >/dev/null 2>&1; then
      bash "$tmp/sectinel/scripts/install.sh" || echo "  ⚠ Sectinel installer failed — install manually."
    else
      echo "  ⚠ could not clone Sectinel. Install it from https://github.com/PockySweet/sectinel"
    fi
  else
    echo "  ⚠ git not found. Install Sectinel manually: https://github.com/PockySweet/sectinel"
  fi
fi

echo ""
echo "✅ Done. Restart opencode (config is loaded at startup, not hot-reloaded),"
echo "   then run:  /breachproof   (or switch to the 'breachproof' agent and say 'detonate')."
