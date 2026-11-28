# Automation & CI/CD Reference

[← Back to Tap Repository](../README.md)

This document describes the automated workflows, local `Makefile` targets, and cross-repository dispatch contracts used to maintain `AtaCanYmc/homebrew-tap`.

## Workflow Overview

| Workflow | Trigger | Purpose | Permissions |
| :--- | :--- | :--- | :--- |
| [`.github/workflows/bump-formula.yml`](../.github/workflows/bump-formula.yml) | `repository_dispatch` (`bump-formula`) | Updates `url` and `sha256`, refreshes Python resources, runs `brew style --fix` and `brew audit --strict`, opens PR | `contents: write`, `pull-requests: write` |
| [`.github/workflows/livecheck.yml`](../.github/workflows/livecheck.yml) | Weekly cron (`0 4 * * 1`), `workflow_dispatch` | Runs `brew livecheck --tap=AtaCanYmc/tap --json` and reports outdated formulae | `contents: read` |
| [`.github/workflows/autobump.yml`](../.github/workflows/autobump.yml) | Daily cron (`50 3 * * *`), `workflow_dispatch`, `push` (`Formula/*.rb`) | Runs `brew bump` and syncs formula versions across `README.md`, `Formula/README.md`, and `docs/index.html` | `contents: write`, `pull-requests: write` |
| [`.github/workflows/tests.yml`](../.github/workflows/tests.yml) | `push` (`main`), `pull_request` | Runs `make test` (`docs-sync` job) and `brew test-bot` on macOS and Ubuntu | `contents: read` |
| [`.github/workflows/pages.yml`](../.github/workflows/pages.yml) | `push` (`main` / `docs/`) | Deploys `docs/` to GitHub Pages | `pages: write`, `id-token: write` |

## Upstream `repository_dispatch` Contract

Upstream repositories can trigger `bump-formula.yml` on release by sending a `repository_dispatch` event with a fine-grained PAT (`COMMITTER_TOKEN`) scoped to `AtaCanYmc/homebrew-tap`:

```yaml
- name: Notify homebrew-tap
  uses: peter-evans/repository-dispatch@v3
  with:
    token: ${{ secrets.COMMITTER_TOKEN }}
    repository: AtaCanYmc/homebrew-tap
    event-type: bump-formula
    client-payload: |
      {
        "formula": "rtfs",
        "version": "${{ github.ref_name }}",
        "url": "https://github.com/AtaCanYmc/rtfs/archive/refs/tags/${{ github.ref_name }}.tar.gz",
        "sha256": "${{ steps.sha.outputs.sha256 }}"
      }
```

### Execution Flow

1. `bump-formula.yml` updates `url` and `sha256` in `Formula/<formula>.rb`.
2. If the formula uses `Language::Python::Virtualenv`, `brew update-python-resources` refreshes PyPI resource blocks.
3. `brew style --fix` and `brew audit --strict` validate the formula.
4. `peter-evans/create-pull-request@v7` opens a pull request on `main`.
5. Merging into `main` triggers `autobump.yml` (version sync to `README.md`, `Formula/README.md`, `docs/index.html`) and `pages.yml` (GitHub Pages deploy).

## Local `Makefile` Targets

| Target | Command | Description |
| :--- | :--- | :--- |
| `make syntax` | `ruby -c Formula/*.rb` | Validates Ruby syntax for all formulae |
| `make style` | `brew style Formula/*.rb` | Checks Homebrew RuboCop style rules |
| `make audit` | `brew audit --strict Formula/*.rb` | Runs strict Homebrew formula audit |
| `make livecheck` | `brew livecheck --tap=AtaCanYmc/tap` | Checks upstream versions against formulae |
| `make js-check` | `node --check docs/app.js` | Validates showcase JavaScript syntax |
| `make diagram` | Chrome headless screenshot | Renders `docs/architecture.html` to `docs/architecture.png` |
| `make test` | `syntax` + `js-check` + doc-sync | Verifies all formulae exist in `README.md`, `Formula/README.md`, and `docs/index.html` |
