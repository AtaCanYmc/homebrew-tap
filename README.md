# Homebrew Tap for AtaCanYmc

[![Actions Status](https://github.com/AtaCanYmc/homebrew-tap/workflows/GitHub%20Actions%20CI/badge.svg)](https://github.com/AtaCanYmc/homebrew-tap/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Official Homebrew Tap providing custom formulae maintained by Ata Can Yaymacı.

Documentation & Showcase website: [https://atacanymc.github.io/homebrew-tap/](https://atacanymc.github.io/homebrew-tap/)

## Table of Contents

- [Available Formulae](#available-formulae)
- [Installation and Usage](#installation-and-usage)
  - [Direct Installation](#direct-installation)
  - [Tapping the Repository](#tapping-the-repository)
  - [Using Brewfile](#using-brewfile)
- [Formula Details](#formula-details)
  - [Lumina](#lumina)
- [Maintenance and Local Testing](#maintenance-and-local-testing)
- [Contributing](#contributing)
- [License](#license)

## Available Formulae

| Formula | Version | Description | Upstream Repository |
| :--- | :--- | :--- | :--- |
| [`lumina`](Formula/lumina.rb) | `1.0.0` | Lithophane and Spiral Betty 3D Art Generator CLI | [AtaCanYmc/lumina](https://github.com/AtaCanYmc/lumina) |

## Installation and Usage

### Direct Installation

Install any formula directly using the tap shorthand:

```bash
brew install AtaCanYmc/tap/lumina
```

### Tapping the Repository

Add the tap to your local Homebrew installation for short command invocation:

```bash
# 1. Tap the repository
brew tap AtaCanYmc/tap

# 2. Install the formula
brew install lumina

# 3. Update all tapped formulae
brew update
```

### Using Brewfile

To declare formulae in your `Brewfile` (for `brew bundle`):

```ruby
tap "AtaCanYmc/tap"
brew "lumina"
```

## Formula Details

### Lumina

Lumina converts 2D raster images into 3D-printable lithophane STL meshes and Spiral Betty raster patterns.

```bash
# Verify installation
lumina --help

# Generate a circular lithophane STL
lumina flat photo.jpg --shape circle --width 120

# Generate a Spiral Betty PNG
lumina spiral portrait.jpg --radius 100 --lines 40
```

## Maintenance and Local Testing

When modifying or updating formulae in this tap, run Homebrew's built-in linting and verification test suite:

```bash
# Audit formula syntax and style constraints
brew audit --strict AtaCanYmc/tap/lumina

# Run formula integration test block
brew test AtaCanYmc/tap/lumina

# Test build from source
brew install --build-from-source AtaCanYmc/tap/lumina
```

## Contributing

1. Fork this repository.
2. Create a feature branch (`git checkout -b update-formula-version`).
3. Update the formula in `Formula/` (source URL, SHA-256 hash, and resources).
4. Verify with `brew audit --strict` and `brew test`.
5. Submit a Pull Request following Conventional Commits format (`feat(lumina): bump version to x.y.z`).

## License

This repository and its formulae are licensed under the MIT License. See [LICENSE](LICENSE) for details.
