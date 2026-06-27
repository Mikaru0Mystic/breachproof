# SOC 2 as a dare

Breachproof treats SOC 2 not as a compliance checkbox but as a challenge: make
the system so locked down, encrypted, least-privileged, logged, signed, and
tamper-proof that *a government agency would have to stop, fail to find a way in,
and politely file a request for a backdoor.*

Every finding it raises and every control it builds is mapped to the SOC 2 Trust
Service Criteria, and the Detonation Report ships a filled-in control matrix.

> Breachproof produces **technical evidence + controls**. It is an engineering
> tool, not an auditor or a legal attestation. Use its output to *prepare* for a
> SOC 2 audit; a CPA firm still issues the report.

## The control map Breachproof fills in

| Criterion | What Breachproof checks / builds |
|---|---|
| **CC1 Control Environment** | ownership, security policy presence, risky-dependency posture |
| **CC2 Communication** | `SECURITY.md`, disclosure process, security docs |
| **CC3 Risk Assessment** | the threat model + the finding register itself |
| **CC4 Monitoring** | logging coverage, alerting, **audit-log integrity** (append-only, tamper-evident) |
| **CC5 Control Activities** | the concrete technical controls it implements |
| **CC6 Logical & Physical Access** | authN/authZ, MFA, least privilege, key management, secrets at rest, session revocation, network isolation, row-level security |
| **CC7 System Operations** | vulnerability management, patching, monitoring, incident-response runbooks |
| **CC8 Change Management** | CI/CD security, signed commits/artifacts, SAST/SCA gates, lockfile integrity, dependency pinning + provenance |
| **CC9 Risk Mitigation** | vendor / supply-chain risk |
| **Confidentiality** | encryption in transit + at rest, data classification |
| **Privacy** | PII handling, GDPR/CCPA data flows (DSAR, minimization, consent) |

For each criterion Breachproof reports: **current posture → gap → the FORTIFY
control** (encrypt it, permission it, log it append-only, sign it, rate-limit it,
alert on it) **+ a CI check** so the control can never silently regress.

The bar is not "passes." The bar is *overbuilt.*
