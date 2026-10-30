# Homebrew tap for BrewAMP

The publisher-maintained Homebrew tap for **BrewAMP**, a free native macOS app for local PHP and MariaDB development on Apple Silicon.

**BrewAMP 0.8.0 is available.** The versioned DMG is Developer ID signed and Apple notarized. Its public HTTPS download and final checksum have been verified.

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
| Version | 0.8.0 |
| Architecture | arm64 |
| Download URL | `https://brewamp.app/downloads/BrewAMP-0.8.0-arm64.dmg` |
| SHA-256 | `0386f053969625783f7f83caf4d76eed76f6b6a4fc91ef0e690ddfd52624a9ad` |
| App bundle identifier | `app.brewamp.BrewAMP` |

The DMG is Developer ID signed and Apple notarized. Public HTTPS delivery, final checksum and the downloaded app's signature and Gatekeeper assessment have been verified. Versioned downloads keep the same bytes once published.

Release 0.8.0 adds custom local hostnames, virtual hosts and optional URLs without port numbers. A bundled, signed helper manages BrewAMP-owned hosts entries and forwards localhost ports 80/443 to the user-owned router. Setup requires explicit approval in macOS; ordinary port-based environments work without the helper. Local HTTPS certificates also cover the environment hostname; certificate trust remains a separate, optional step.

Validated on October 30, 2026: Homebrew style, strict online audit, livecheck (0.8.0), and an actual registered-Cask upgrade from 0.7.1 to 0.8.0. All 110,175 recorded project/data files and symlinks, exact environment catalog, hosts file and shared formula versions survived unchanged. The installed app passes strict signature/Gatekeeper checks, launches and automatically reconnects its approved helper. The previously running environment is restored. No extra uninstall/reinstall or separate-Mac test was performed for this release.

The Cask includes a `livecheck` rule that reads versioned DMG links on the public homepage. For each future release, update `version` and `sha256` after signing, notarization and final ticket stapling. Keep previously published files unchanged.

## Upgrade and uninstall

```sh
brew update
brew upgrade --cask fabsi88/brewamp/brewamp
brew uninstall --cask fabsi88/brewamp/brewamp
```

**If you enabled local addresses, first open BrewAMP → Local addresses… → Remove setup.** This removes your BrewAMP-owned hosts entries and unregisters the helper. The Cask does not automatically remove those persistent entries. On upgrades, open Local addresses… → Update setup if the app requests helper re-registration; macOS may ask for approval again.

Uninstalling quits BrewAMP, which stops the services managed by the app, and removes the app. **Projects, databases, environment configuration and shared Homebrew packages remain in place.** Even an explicit `--zap` removes only the production app's preferences and saved window state; the Cask never removes `~/Library/Application Support/BrewAMP` or any environment data. Use BrewAMP's own environment deletion flow when you intend to move an environment and its data to Trash.

## Publisher and support

BrewAMP is published by **funok consulting UG (haftungsbeschränkt)**. Website: https://www.brewamp.app/.

Use this repository's issues for Cask packaging problems. For a local report, avoid posting database passwords, project files or other private data. The app remains free; optional support does not unlock features.

Tap definitions and documentation are MIT licensed; see [LICENSE](LICENSE). Programs installed through Homebrew retain their respective licenses.
