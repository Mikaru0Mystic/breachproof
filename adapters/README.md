# Adapters: run Breachproof on any agent runtime

Breachproof is a **portable Markdown agent** (`agent/breachproof.md`) plus a
trigger (`command/breachproof.md`). Its arsenal,
[Sectinel](https://github.com/Mikaru0Mystic/sectinel), is authored to the open
[agentskills.io](https://agentskills.io) standard. So Breachproof is not bound to
any one tool: here is how to load it everywhere.

> Install the [Sectinel](https://github.com/Mikaru0Mystic/sectinel) arsenal first so
> Breachproof has its 784 skills + scanner wiring available.

## opencode (first-class)
```bash
bash scripts/install.sh        # → ~/.config/opencode/agent + command
```
Restart opencode, then `/breachproof`.

## Claude Code (first-class)
```bash
cp agent/breachproof.md ~/.claude/agents/breachproof.md
# Sectinel installs its skills to ~/.claude/skills/
```
Invoke with `@breachproof` or "use the breachproof agent."

## Hermes Agent (NousResearch)
Hermes loads [agentskills.io](https://agentskills.io) skills natively. Install
the Sectinel arsenal (agentskills.io format) and load `agent/breachproof.md` as
the system/operator prompt. Hermes' tool-calling drives the same scan→fix→verify
loop. See the Sectinel arsenal's `SKILL.md` frontmatter: it is Hermes-ready.

## OpenClaw
OpenClaw consumes agentskills.io skills + portable agent prompts. Point it at
the Sectinel arsenal and load `agent/breachproof.md` as the agent definition; the
`/breachproof` directive in `command/breachproof.md` is the one-shot trigger.

## Cursor
```bash
mkdir -p .cursor/rules
cp adapters/cursor/breachproof.mdc .cursor/rules/     # generated from agent/breachproof.md
```

## OpenAI Codex CLI
```bash
cp adapters/codex/breachproof.md  <your-codex-config-dir>/
```

## Cline · Windsurf · Roo Code · Continue · Aider · Gemini CLI
Any runtime that loads the agentskills.io standard or a Markdown system prompt
works: install the Sectinel arsenal and supply `agent/breachproof.md` as the
agent/system prompt.

---

### Regenerating adapters
The Cursor `.mdc` and Codex `.md` adapters are thin wrappers around
`agent/breachproof.md`. To regenerate after editing the agent:
```bash
bash scripts/build-adapters.sh
```
The canonical source of truth is always `agent/breachproof.md`.
