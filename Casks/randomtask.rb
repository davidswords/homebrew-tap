cask "randomtask" do
  version "0.4.0"
  sha256 "b61f5a02e05febe1782f303ef0c5d3cbede7ac3d686bb0d462ca13bc80c8079a"

  url "https://github.com/davidswords/randomtask/releases/download/v#{version}/randomtask_#{version}_aarch64.dmg"
  name "randomtask"
  desc "Minimal, client-side encrypted todo app"
  homepage "https://github.com/davidswords/randomtask"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "randomtask.app"

  # Includes the files of randomnote, the app's name up to 0.2.0.
  zap trash: [
    "~/Library/Application Support/engineering.swords.randomnote",
    "~/Library/Application Support/engineering.swords.randomtask",
    "~/Library/Caches/engineering.swords.randomnote",
    "~/Library/Caches/engineering.swords.randomtask",
    "~/Library/Preferences/engineering.swords.randomnote.plist",
    "~/Library/Preferences/engineering.swords.randomtask.plist",
    "~/Library/Saved Application State/engineering.swords.randomnote.savedState",
    "~/Library/Saved Application State/engineering.swords.randomtask.savedState",
    "~/Library/WebKit/engineering.swords.randomnote",
    "~/Library/WebKit/engineering.swords.randomtask",
  ]

  caveats <<~EOS
    randomtask is not yet signed with an Apple Developer ID, so macOS blocks
    it on first launch. To open it, go to System Settings > Privacy & Security
    and click "Open Anyway", or run:

      xattr -dr com.apple.quarantine "#{appdir}/randomtask.app"
  EOS
end
