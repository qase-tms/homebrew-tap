# Qase Homebrew Tap

Official Homebrew formulae and casks for [Qase](https://qase.io) tools.

## Installation

```bash
brew tap qase-tms/tap
```

## Available

| Name | Type | Description | Install |
|---|---|---|---|
| [qasectl](https://github.com/qase-tms/qasectl) | Formula | CLI for Qase test management | `brew install qase-tms/tap/qasectl` |
| [qase-tunnel](https://github.com/qase-tms/qase-tunnel) | Cask | Customer-side tunnel for private-host access from Qase Cloud | `brew install --cask qase-tms/tap/qase-tunnel` |

## Usage

```bash
# CLI formula
brew install qase-tms/tap/qasectl

# Cask (pre-built binary)
brew install --cask qase-tms/tap/qase-tunnel
```

Upgrade with `brew upgrade <name>` or `brew upgrade --cask <name>` respectively.

## How It Works

Formulae and casks are automatically updated by each source repository's release pipeline when a new tag is pushed.
