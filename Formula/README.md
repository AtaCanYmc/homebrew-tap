# Formula Directory

[← Back to Tap Repository](../README.md)

This directory contains Homebrew formula specifications (`.rb`) maintained in this tap.

## Formula Inventory

| File | Formula Name | Version | License | Target Binary |
| :--- | :--- | :--- | :--- | :--- |
| [`forex-pytory.rb`](forex-pytory.rb) | `forex-pytory` | `0.2.0` | Apache-2.0 | `forex-scraper`, `forex-mcp` |
| [`home-lite-llm.rb`](home-lite-llm.rb) | `home-lite-llm` | `1.2.0` | MIT | `hlm` |
| [`izko-gold-price-api.rb`](izko-gold-price-api.rb) | `izko-gold-price-api` | `0.2.0` | MIT | `izko-gold-price-api`, `izko-gold-price-mcp` |
| [`izmir-cli.rb`](izmir-cli.rb) | `izmir-cli` | `2.2.0` | Apache-2.0 | `izmir-cli`, `izmir`, `izmir-mcp` |
| [`izmir-data.rb`](izmir-data.rb) | `izmir-data` | `0.3.1` | Apache-2.0 | `izmir-data`, `izmir-mcp` |
| [`lumina.rb`](lumina.rb) | `lumina` | `1.3.0` | MIT | `lumina` |
| [`reels-wiki.rb`](reels-wiki.rb) | `reels-wiki` | `0.1.2` | MIT | `reels-sync` |
| [`resmi-gazete-cli.rb`](resmi-gazete-cli.rb) | `resmi-gazete-cli` | `0.1.3` | Apache-2.0 | `resmi-gazete-cli`, `resmi-gazete-mcp` |
| [`robo-market-search.rb`](robo-market-search.rb) | `robo-market-search` | `1.12.0` | Apache-2.0 | `robo-search` |
| [`rtfs.rb`](rtfs.rb) | `rtfs` | `0.1.2` | AGPL-3.0-or-later | `rtfs` |
| [`rubberorca.rb`](rubberorca.rb) | `rubberorca` | `0.1.4` | Apache-2.0 | `rubberorca`, `rubberorca-mcp` |
| [`rubberotter.rb`](rubberotter.rb) | `rubberotter` | `1.4.0` | Apache-2.0 | `rubberotter`, `otter-cli` |
| [`rxresume.rb`](rxresume.rb) | `rxresume` | `0.8` | MIT | `rxresume`, `rxresume-mcp` |
| [`stock-fetcher.rb`](stock-fetcher.rb) | `stock-fetcher` | `0.4.0` | Apache-2.0 | `stock-fetcher` |
| [`yargitay-karar-scraper.rb`](yargitay-karar-scraper.rb) | `yargitay-karar-scraper` | `0.1.4` | Apache-2.0 | `yargitay-karar-cli`, `yargitay-karar-mcp` |

## Formula Standards

Each Ruby formula in this directory adheres to the following constraints:

1. **Class Naming**: CamelCase class name matching the filename. For example, `Lumina` for `lumina.rb` and `RoboMarketSearch` for `robo-market-search.rb`.
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
