# Security Policy

## Supported Versions

Security updates and patches are applied to the `main` branch. Older commits or custom checkouts are not maintained.

| Component | Supported Version | Notes |
| :--- | :--- | :--- |
| `Formula/lumina.rb` | `>= 1.0.0` | Upstream package releases on PyPI |
| `Formula/robo-market-search.rb` | `>= 1.10.0` | Upstream package releases on PyPI |
| Tap Infrastructure & CI | `main` | Continuous deployment via GitHub Actions |

## Reporting a Vulnerability

If you discover a security vulnerability or package integrity defect in any formula in this tap, do not open a public issue.

Please report the issue via one of the following private channels:

1. **GitHub Security Advisory**: Submit a private report through [GitHub Security Advisories](https://github.com/AtaCanYmc/homebrew-tap/security/advisories/new).
2. **Direct Maintainer Contact**: Email the maintainer directly at `atacanymc@gmail.com` with the subject line `[SECURITY] Homebrew Tap Vulnerability Report`.

### Required Information

When submitting a report, include:

- Name of the affected formula and version.
- Step-by-step reproduction instructions or proof of concept.
- Assessment of impact (e.g. arbitrary code execution, untrusted binary substitution, malicious dependency).

### Response SLA

- **Initial Response**: Within 48 hours of receipt.
- **Triage and Status Update**: Within 5 business days.
- **Disclosure Policy**: Coordinated disclosure after a fix has been verified and released to the `main` branch.
