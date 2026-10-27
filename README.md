# Homebrew tap for BrewAMP

The publisher-maintained Homebrew tap for **BrewAMP**, a free native macOS app for local PHP and MariaDB development on Apple Silicon.

**BrewAMP 0.7.1 is available.** The versioned DMG is Developer ID signed and Apple notarized. Its public HTTPS download and final checksum have been verified.

## Installation

```sh
brew install --cask fabsi88/brewamp/brewamp
```

To inspect the tap without installing the app:

```sh
brew tap fabsi88/brewamp
brew info --cask fabsi88/brewamp/brewamp
```

This is a third-party tap maintained by the BrewAMP publisher. It is not a listing in Homebrew's official `homebrew/cask` repository and does not imply Homebrew endorsement.

## Requirements

- Apple Silicon Mac; Intel is not supported.
- The app requires macOS 14 or later. macOS 15 or later is recommended for current Homebrew support.
- Homebrew at `/opt/homebrew`.

The Cask installs **BrewAMP.app**. PHP, MariaDB, nginx/Apache and optional phpMyAdmin packages are chosen and installed from within BrewAMP as needed. They are not all installed as fixed Cask dependencies.

## Current release

| Field | Value |
| --- | --- |
| Version | 0.7.1 |
| Architecture | arm64 |
| Download URL | `https://brewamp.app/downloads/BrewAMP-0.7.1-arm64.dmg` |
| SHA-256 | `6d802bba5b84d1f131bb4e589a3cae9cee8fdb48ab6ea98be81aa406b8e66ac4` |
| App bundle identifier | `app.brewamp.BrewAMP` |

The DMG is Developer ID signed and Apple notarized. Public HTTPS delivery, final checksum and the downloaded app's signature and Gatekeeper assessment have been verified. Versioned downloads keep the same bytes once published.

Release 0.7.1 adds update notifications, a manual Check for Updates command and a daily startup-check limit with an opt-out in Settings. Installation remains an explicit DMG or Homebrew step.

Validated on October 27, 2026: Homebrew style, strict online audit, livecheck (0.7.1), and an actual upgrade of the registered Cask from 0.7.0 to 0.7.1 in Applications. All 118,516 recorded project/data files and symlinks, exact environment catalog and shared formula versions survived unchanged. Strict signature and Gatekeeper checks pass. The signed app launches, checks the live update feed and restores the previously running environment. An additional uninstall/reinstall cycle was not run for this release.

The Cask includes a `livecheck` rule that reads versioned DMG links on the public homepage. For each future release, update `version` and `sha256` after signing, notarization and final ticket stapling. Keep previously published files unchanged.

## Upgrade and uninstall

```sh
brew update
brew upgrade --cask fabsi88/brewamp/brewamp
brew uninstall --cask fabsi88/brewamp/brewamp
```

Uninstalling quits BrewAMP, which stops the services managed by the app, and removes the app. **Projects, databases, environment configuration and shared Homebrew packages remain in place.** Even an explicit `--zap` removes only the production app's preferences and saved window state; the Cask never removes `~/Library/Application Support/BrewAMP` or any environment data. Use BrewAMP's own environment deletion flow when you intend to move an environment and its data to Trash.

## Publisher and support

BrewAMP is published by **funok consulting UG (haftungsbeschränkt)**. Website: https://www.brewamp.app/.

Use this repository's issues for Cask packaging problems. For a local report, avoid posting database passwords, project files or other private data. The app remains free; optional support does not unlock features.

Tap definitions and documentation are MIT licensed; see [LICENSE](LICENSE). Programs installed through Homebrew retain their respective licenses.
