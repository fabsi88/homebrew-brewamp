cask "brewamp" do
  version "0.7.1"
  sha256 "6d802bba5b84d1f131bb4e589a3cae9cee8fdb48ab6ea98be81aa406b8e66ac4"

  url "https://brewamp.app/downloads/BrewAMP-#{version}-arm64.dmg"
  name "BrewAMP"
  desc "Local PHP and MariaDB development environments"
  homepage "https://brewamp.app/"

  livecheck do
    url :homepage
    regex(/href=["']?[^"' >]*BrewAMP[._-]v?(\d+(?:\.\d+)+)[._-]arm64\.dmg/i)
  end

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
