cask "randomtask" do
  version "0.6.0"
  sha256 "579196e19d0363bbcb6dbababd9d73bb1d36867cb1fe3c547a0dd7d2fbfc13a3"

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

  # A `randomtask` command that opens the app, as clicking it does.
  shimscript = "#{staged_path}/randomtask.wrapper.sh"

  app "randomtask.app"
  binary shimscript, target: "randomtask"

  preflight do
    File.write shimscript, <<~EOS
      #!/bin/sh
      exec open -a "#{appdir}/randomtask.app"
    EOS
  end

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
