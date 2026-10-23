cask "randomnote" do
  version "0.2.0"
  sha256 "6650743eeb81b8591459ef2ad6daaff3f6e8490e7e99b2191cfd4bb94861b7e9"

  url "https://github.com/davidswords/randomnote/releases/download/v#{version}/randomnote_#{version}_aarch64.dmg"
  name "randomnote"
  desc "Minimal, client-side encrypted todo app"
  homepage "https://github.com/davidswords/randomnote"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "randomnote.app"

  zap trash: [
    "~/Library/Application Support/engineering.swords.randomnote",
    "~/Library/Caches/engineering.swords.randomnote",
    "~/Library/Preferences/engineering.swords.randomnote.plist",
    "~/Library/Saved Application State/engineering.swords.randomnote.savedState",
    "~/Library/WebKit/engineering.swords.randomnote",
  ]

  caveats <<~EOS
    randomnote is not yet signed with an Apple Developer ID, so macOS blocks
    it on first launch. To open it, go to System Settings > Privacy & Security
    and click "Open Anyway", or run:

      xattr -dr com.apple.quarantine "#{appdir}/randomnote.app"
  EOS
end
