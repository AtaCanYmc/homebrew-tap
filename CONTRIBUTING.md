# Contributing to AtaCanYmc Homebrew Tap

Contributions to add, update, or fix formulae in this tap are welcome. Please read this document to understand the submission process and packaging standards.

## Code of Conduct

All contributors and maintainers are expected to maintain a constructive, respectful, and professional environment.

## Development Workflow

### 1. Prerequisites

Ensure you have a functional Homebrew installation on macOS or Linux:

```bash
brew --version
```

Clone your fork of the repository locally:

```bash
git clone https://github.com/<your-username>/homebrew-tap.git
cd homebrew-tap
```

### 2. Branching Strategy

Create a dedicated branch using the standard prefix format:

- New formula: `feat/<formula-name>`
- Version bump: `bump/<formula-name>-<version>`
- Bug fix or dependency adjustment: `fix/<formula-name>`
- Documentation: `docs/<description>`

Example:

```bash
git checkout -b feat/new-tool
```

### 3. Formula Packaging Guidelines

Homebrew formulae in this tap follow strict quality guidelines:

1. **Deterministic Sources**:
   - Source archives must point to stable release tarballs from PyPI or GitHub release tags.
   - Never use direct branch references or unversioned archive URLs.
   - Always verify the SHA-256 checksum:
     ```bash
     curl -sL <tarball-url> | shasum -a 256
     ```

2. **Python Virtualenv Standards**:
   - Python tools must use `Language::Python::Virtualenv`.
   - All external wheel or tarball dependencies must be explicitly declared as `resource` blocks with their own immutable URL and SHA-256 checksum.
   - Dependencies must install cleanly via `virtualenv_install_with_resources` or explicit `venv.pip_install`.

3. **Formula Testing**:
   - Every formula must include a `test do ... end` block.
   - The test must execute without internet access (e.g. running `--help` or checking `--version`).

### 4. Local Verification Suite

Run Homebrew's built-in linting and verification commands before committing:

```bash
# 1. Audit formula syntax and style constraints
brew audit --strict ./Formula/<formula-name>.rb

# 2. Run formula integration test
brew test ./Formula/<formula-name>.rb

# 3. Test build from source
brew install --build-from-source ./Formula/<formula-name>.rb
```

### 5. Commit Guidelines

Commits must follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

- `feat(formula-name): add formula-name v1.0.0`
- `bump(formula-name): bump version to 1.1.0`
- `fix(formula-name): resolve missing opencv dependency`
- `docs: update quick start instructions`
- `ci: update test-bot matrix configuration`

### 6. Pull Request Submission

1. Push your branch to your fork.
2. Open a Pull Request against the `main` branch of `AtaCanYmc/homebrew-tap`.
3. Complete the pull request checklist.
4. Ensure all GitHub Actions CI checks (`brew test-bot`) pass.
