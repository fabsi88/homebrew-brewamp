cask "brewamp" do
  version "0.7.0"
  sha256 "deceb4073edfd6f90f78ba23f7751a169ff93f9ddd0e8449cf4ca4b7e83a126e"

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
