cask "heymate" do
  version :latest
  sha256 :no_check

  url "https://github.com/UmarSiddiqui/heymate/releases/latest/download/HeyMate.dmg",
      verified: "github.com/UmarSiddiqui/heymate/"
  name "HeyMate"
  desc "AI buddy in the MacBook notch that answers questions about your screen"
  homepage "https://getheymate.vercel.app/"

  depends_on macos: :sonoma

  app "HeyMate.app"

  # HeyMate is signed with a self-signed certificate, not Apple Developer ID,
  # so Gatekeeper would block the quarantined copy. Same as the official
  # installer at https://getheymate.vercel.app/install.sh.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/HeyMate.app"],
        writable_paths: ["{{appdir}}/HeyMate.app"]
  end

  uninstall quit: "com.heymate.app"

  zap trash: [
    "~/Library/Application Support/heymate",
    "~/Library/Caches/com.heymate.app",
    "~/Library/HTTPStorages/com.heymate.app",
    "~/Library/Preferences/com.heymate.app.plist",
  ]
end
