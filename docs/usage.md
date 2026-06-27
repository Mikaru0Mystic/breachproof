# Usage

## Fire it

```
/breachproof                 # detonate against the current project
/breachproof ./services/api  # target a specific directory
```

Or switch to the **breachproof** agent (in opencode, cycle agents with Tab) and
say *"detonate"* / *"scan and fix this project."*

Breachproof then runs the full [Detonation Sequence](architecture.md) on its own
and surfaces once, at the end, with a **Detonation Report** + a final clean
re-scan as proof.

## What to expect

1. It writes a TodoWrite plan and narrates each phase.
2. It runs the scan wave in parallel (ship-safe, the Sectinel sweep, semgrep,
   secrets, SCA, IaC, CI, AI-surface).
3. It applies fixes directly to your code and (if it's a git repo) commits each
   remediation wave with a clear message. **It never pushes, merges, or deploys.**
4. It re-scans, loops, and only stops at the Definition of Done.

## Authorizing live pentests (optional)

The static + SCA + secret + IaC + remediation pipeline reaches zero on its own.
To additionally run the **active-exploitation** engines (Shannon / PentAGI),
tell Breachproof you own the target and give it the running URL, e.g.:

```
/breachproof   then:   "I own https://staging.myapp.com — you may run Shannon against it, repo at ./."
```

Breachproof will refuse active exploitation without that confirmation.

## Use it in CI

Breachproof is interactive, but the scanners it wields are CI-ready. A typical
gate (see also the regression workflow Breachproof writes for you):

```yaml
# .github/workflows/security.yml
name: Security
on: [push, pull_request]
permissions: { contents: read }
jobs:
  scan:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npx ship-safe ci . --threshold 90 --sarif results.sarif
      - uses: github/codeql-action/upload-sarif@v3
        if: always()
        with: { sarif_file: results.sarif }
```

## Troubleshooting

- **Agent doesn't appear** → you didn't restart opencode (config loads at
  startup, no hot-reload). Quit the app fully and reopen.
- **"Sectinel arsenal not found"** → run the [Sectinel](https://github.com/PockySweet/sectinel)
  installer; Breachproof still runs Tier-1/3/4 scanners without it.
- **A scanner is missing** → Breachproof self-heals (installs or substitutes);
  if it can't, it falls back to the matching skill's manual method and notes it.
- **It stopped early** → check the report for a `NEEDS-HUMAN-DECISION` item
  (e.g. "rotate this leaked production key") — those are the only things it
  hands back.
