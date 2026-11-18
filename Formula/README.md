# Formula Directory

[← Back to Tap Repository](../README.md)

This directory contains Homebrew formula specifications (`.rb`) maintained in this tap.

## Formula Inventory

| File | Formula Name | Version | License | Target Binary |
| :--- | :--- | :--- | :--- | :--- |
| [`forex-pytory.rb`](forex-pytory.rb) | `forex-pytory` | `0.1.2` | Apache-2.0 | `forex-scraper`, `forex-mcp` |
| [`lumina.rb`](lumina.rb) | `lumina` | `1.0.0` | MIT | `lumina` |
| [`robo-market-search.rb`](robo-market-search.rb) | `robo-market-search` | `1.10.0` | Apache-2.0 | `robo-search` |
| [`yargitay-karar-scraper.rb`](yargitay-karar-scraper.rb) | `yargitay-karar-scraper` | `0.1.1` | Apache-2.0 | `yargitay-karar-cli`, `yargitay-karar-mcp` |

## Formula Standards

Each Ruby formula in this directory adheres to the following constraints:

1. **Class Naming**: CamelCase class name matching the filename (e.g. `Lumina` for `lumina.rb`, `RoboMarketSearch` for `robo-market-search.rb`).
2. **Virtual Environment Isolation**: Uses `Language::Python::Virtualenv` to encapsulate Python runtime dependencies without polluting the host environment.
3. **Explicit Resources**: Every transitive package is declared with an immutable PyPI source URL and SHA-256 integrity hash.
4. **Offline Test Suite**: The `test` block validates CLI binary presence and help output without requiring network access.

## Verification

To audit or test an individual formula locally:

```bash
# Audit style and Homebrew rules
brew audit --strict Formula/<formula-name>.rb

# Execute formula test block
brew test Formula/<formula-name>.rb
```
