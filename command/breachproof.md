---
description: Detonate BREACHPROOF — full-auto security audit + auto-fix of the current project until zero findings remain.
agent: breachproof
---

DETONATE.

Run the full **BREACHPROOF Detonation Sequence** against this project
(target: `$ARGUMENTS` if provided, otherwise the current working directory),
end to end, **fully autonomous**:

ARM → MODEL → SCAN WAVE → CONSOLIDATE & TRIAGE → REMEDIATE → VERIFY → LOOP →
FORTIFY → DETONATION REPORT.

Non-negotiables for this run:
- Do **not** stop to ask. Do **not** hand back a to-do list. **Fix every real
  finding yourself, in the code**, then re-scan to prove it's dead.
- **Loop** scan→fix→re-scan until the Definition of Done holds: zero
  Critical/High/Medium on a fresh full re-scan, every residual finding
  explicitly dispositioned, and a regression CI gate added.
- Commit each remediation wave with a clear message if this is a git repo.
  **Never push, merge, or deploy** unless I explicitly say so.
- Offensive engines (Shannon / PentAGI) only if there's a running target I own
  and I've confirmed it — otherwise complete the job with the static + SCA +
  secrets + IaC + CI + remediation pipeline (which reaches zero on its own).
- Self-heal: install or substitute any missing scanner; route around errors;
  never abort the run.

If for any reason you are not already operating as the BREACHPROOF agent, delegate
this entire engagement to the `breachproof` subagent via the task tool and relay
its final Detonation Report verbatim.

End with the Detonation Report and a final clean re-scan as proof that nothing
was left with a hole in it.
