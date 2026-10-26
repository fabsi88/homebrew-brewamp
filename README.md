# Homebrew tap for BrewAMP

The publisher-maintained Homebrew tap for **BrewAMP**, a free native macOS app for local PHP and MariaDB development on Apple Silicon.

**Launch status: prepared, not yet installable.** The Cask is intentionally disabled while the first public DMG download is awaiting the brewamp.app website launch. The repository is public; the download and installation have not been activated yet.

## Installation after launch

Once the signed download is publicly available and the Cask has been enabled:

```sh
brew install --cask fabsi88/brewamp/brewamp
```

To inspect this tap before launch without installing the app:

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

## Prepared release

| Field | Value |
| --- | --- |
| Version | 0.5.3 |
| Architecture | arm64 |
| Planned download URL | `https://brewamp.app/downloads/BrewAMP-0.5.3-arm64.dmg` |
| SHA-256 | `800b2c3c606660e8dc48eb6eca1de6ba56575f54c9f7d58bde06feaf3a81d2fb` |
| App bundle identifier | `app.brewamp.BrewAMP` |

The prepared DMG is Developer ID signed and Apple notarized. Its public HTTP delivery and installation through this tap remain to be verified after hosting is enabled. The versioned download must keep the same bytes once published.

## Launch checklist

1. Publish the prepared, notarized DMG at the exact planned HTTPS URL.
2. Download it through that public URL and verify the SHA-256 above. Check the enclosed app's signature, notarization and Gatekeeper assessment.
3. Remove the temporary `disable!` stanza from `Casks/brewamp.rb` and update this launch-status notice.
4. Run Cask style/audit checks and test installation on a suitable Apple Silicon Mac, preferably a separate clean Mac. Verify launch and uninstall behavior while preserving environment data.
5. Push the enabled Cask and update the website's Homebrew instructions from “Coming soon” to the working installation command.

The Cask includes a `livecheck` rule that reads versioned DMG links on the homepage once it is public. For each future release, update `version` and `sha256` after signing, notarization and final ticket stapling. Keep previously published files unchanged.

## Upgrade and uninstall after launch

```sh
brew update
brew upgrade --cask fabsi88/brewamp/brewamp
brew uninstall --cask fabsi88/brewamp/brewamp
```

Uninstalling quits BrewAMP, which stops the services managed by the app, and removes the app. **Projects, databases, environment configuration and shared Homebrew packages remain in place.** Even an explicit `--zap` removes only the production app's preferences and saved window state; the Cask never removes `~/Library/Application Support/BrewAMP` or any environment data. Use BrewAMP's own environment deletion flow when you intend to move an environment and its data to Trash.

## Publisher and support

BrewAMP is published by **funok consulting UG (haftungsbeschränkt)**. Website: https://brewamp.app/ (launch pending).

Use this repository's issues for Cask packaging problems. For a local report, avoid posting database passwords, project files or other private data. The app remains free; optional support does not unlock features.

Tap definitions and documentation are MIT licensed; see [LICENSE](LICENSE). Programs installed through Homebrew retain their respective licenses.
