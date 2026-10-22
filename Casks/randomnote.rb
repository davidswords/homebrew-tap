cask "randomnote" do
  version "0.1.1"
  sha256 "149f44cc10dba56fb820d4a88daeac6b7a609193f2ab082615c8e8ec5ad20317"

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
