# Security Policy

Breachproof is a security tool. We hold it to the standard it enforces.

## Reporting a vulnerability

**Do not open a public issue for a security vulnerability.**

Report privately via GitHub Security Advisories:
**https://github.com/PockySweet/breachproof/security/advisories/new**

We aim to acknowledge within **48 hours** and to agree on a disclosure timeline
with you. Coordinated disclosure is appreciated; we credit reporters who want it.

Please include:
- A description of the issue and its impact.
- Steps to reproduce (a PoC if you have one).
- Affected version / commit.

## Scope

In scope:
- The Breachproof agent + command definitions and installers in this repository.
- Behaviors that cause Breachproof to **leak secrets**, **execute unintended
  destructive actions**, **disable its own safety gates**, or **misreport a
  vulnerable codebase as clean**.

Out of scope (report upstream):
- Bugs in the integrated tools themselves (Sectinel, ship-safe, Shannon,
  PentAGI, semgrep, etc.) — please report to those projects.

## Acceptable use

Breachproof can drive **active-exploitation engines** (Shannon, PentAGI) that
launch real attacks. These are gated: Breachproof will only run them against a
target you confirm you **own or are explicitly authorized to test**.

Running active scans or exploits against systems you do not own or have written
permission to test is **illegal** in most jurisdictions (e.g. the U.S. Computer
Fraud and Abuse Act and equivalents). You are solely responsible for ensuring
authorization. The authors accept no liability for misuse.

The static analysis, SCA, secret, IaC, and remediation pipeline is defensive and
operates only on source you provide.
