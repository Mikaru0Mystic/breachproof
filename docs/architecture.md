# Architecture

Breachproof is a **prompt-defined autonomous agent** plus a **trigger command**.
It carries no runtime of its own: it drives the tools and skills provided by
[Sectinel](https://github.com/Mikaru0Mystic/sectinel) through the host agent runtime
(opencode / Claude Code).

```
        you ──"/breachproof"──▶  ┌─────────────────────────────┐
                                 │  BREACHPROOF agent           │
                                 │  (autonomy loop + persona)   │
                                 └──────────────┬──────────────┘
                                                │ orchestrates
        ┌───────────────────────────────────────┼───────────────────────────────────────┐
        ▼                     ▼                  ▼                  ▼                      ▼
   Tier1 scanners       Sectinel 784-skill   semgrep / SCA /   security MCP        Shannon / PentAGI
   (ship-safe …)        arsenal (on demand)  secrets / IaC     servers             (authorized only)
        └───────────────────────────────────────┴───────────────────────────────────────┘
                                                │ findings
                                                ▼
                                   triage → remediate (edit code) → verify (re-scan)
                                                │  loop until clean
                                                ▼
                                   fortify (defense-in-depth + CI gate) → report
```

## Components

| Piece | File | Role |
|---|---|---|
| Agent | `agent/breachproof.md` | The weapon: persona, autonomy mandate, Definition of Done, the Detonation Sequence, SOC 2 mapping, rules of engagement, report format. |
| Command | `command/breachproof.md` | The `/breachproof` one-shot trigger that detonates the agent against the current project. |
| Arsenal | (from Sectinel) `~/.config/opencode/cybersec-arsenal/` | 784 skills, read on demand: zero per-session context cost. |
| Flagship skill | (from Sectinel) `~/.claude/skills/cybersecurity` | AgriciDaniel's 8-agent sweep, invocable via the skill tool. |

## Design principles

- **Autonomy over advice.** The agent fixes; it does not hand back a to-do list.
- **Loop to a hard stop.** The Definition of Done (zero Critical/High/Medium on
  re-scan + dispositioned residuals + a regression gate) is the only exit.
- **Read-on-demand arsenal.** 784 skills live on disk; the agent greps + reads
  the one playbook it needs, so the context window stays lean.
- **Defensive by default, offensive by authorization.** The static + SCA +
  secret + IaC + remediation pipeline reaches zero without ever launching a live
  attack. Shannon/PentAGI are an optional, gated escalation.
- **Verification is non-negotiable.** No fix is "done" without a green re-scan.
