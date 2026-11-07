cask "heymate" do
  version :latest
  sha256 :no_check

  url "https://github.com/UmarSiddiqui/heymate/releases/latest/download/HeyMate.dmg"
  name "HeyMate"
  desc "AI buddy in the MacBook notch that answers questions about your screen"
  homepage "https://sayheymate.com/"

  depends_on macos: :sonoma

  app "HeyMate.app"

  uninstall quit: "com.heymate.app"

  zap trash: [
    "~/Library/Application Support/heymate",
    "~/Library/Caches/com.heymate.app",
    "~/Library/HTTPStorages/com.heymate.app",
    "~/Library/Preferences/com.heymate.app.plist",
  ]
end
