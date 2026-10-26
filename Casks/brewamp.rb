cask "brewamp" do
  version "0.5.2"
  sha256 "b861669e3b56f38ebb660914df22f7f114ad0dc97e7da159144bcc6eae36a9fc"

  url "https://brewamp.app/downloads/BrewAMP-#{version}-arm64.dmg"
  name "BrewAMP"
  desc "Local PHP and MariaDB development environments"
  homepage "https://brewamp.app/"

  livecheck do
    url :homepage
    regex(/href=["']?[^"' >]*BrewAMP[._-]v?(\d+(?:\.\d+)+)[._-]arm64\.dmg/i)
  end

  # Remove only after the public DMG URL and its checksum have been verified.
  disable! date: "2026-10-26", because: "the first public download is pending the brewamp.app launch"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "BrewAMP.app"

  uninstall quit: "app.brewamp.BrewAMP"

  # Project files, databases and Homebrew packages are deliberately preserved.
  zap trash: [
    "~/Library/Preferences/app.brewamp.BrewAMP.plist",
    "~/Library/Saved Application State/app.brewamp.BrewAMP.savedState",
  ]
end
