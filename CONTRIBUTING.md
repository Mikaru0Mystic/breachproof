# Contributing to Breachproof

Thanks for helping make codebases breachproof. The highest-signal contribution
is **field feedback**: you pointed Breachproof at a real project and it missed a
class of bug, faked a fix, stalled, or did something dumb. Tell us: that's
exactly the evidence that makes the next version sharper.

## Ways to contribute

- **Field reports**: open an issue with what Breachproof did vs. what it should
  have done (redact secrets). This is the most valuable contribution.
- **Detonation-sequence / agent-prompt improvements**: sharpen the autonomy
  loop, triage, remediation, or SOC 2 mapping in `agent/breachproof.md`.
- **New tool / skill wiring**: teach Breachproof to use another scanner, MCP,
  or Sectinel skill. (New *skills* themselves usually belong in
  [Sectinel](https://github.com/Mikaru0Mystic/sectinel).)
- **Docs**: clearer install, usage, or SOC 2 guidance.

## Ground rules

1. **Keep the safety gates.** Any change must preserve the authorization gate on
   active-exploitation engines and the "never fake green / never suppress a real
   finding" rule. PRs that weaken these will be rejected.
2. **The agent must still load.** `agent/breachproof.md` and
   `command/breachproof.md` must keep valid YAML frontmatter. CI checks this.
3. **No secrets, no live targets** in commits, tests, or examples.
4. **Verify-before-claim.** If you change remediation behavior, show that it
   still re-scans and proves the fix.

## Workflow

1. Fork and branch (`feat/...`, `fix/...`, `docs/...`).
2. Make the change; test it by running `/breachproof` against a sample repo.
3. Open a PR using the template. Describe the behavior change and how you verified it.

## Code of Conduct

This project follows the [Contributor Covenant](CODE_OF_CONDUCT.md). By
participating you agree to uphold it.

## License

By contributing, you agree your contributions are licensed under the
[Apache License 2.0](LICENSE).
