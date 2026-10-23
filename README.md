# davidswords/homebrew-tap

Homebrew casks for apps by [Swords Engineering](https://swords.engineering).

## Install

```
brew tap davidswords/tap
brew trust --cask davidswords/tap/randomtask
brew install randomtask
```

Homebrew requires you to trust casks from third-party taps before it uses them. `brew trust --cask` trusts only the named cask. `brew trust davidswords/tap` trusts every current and future cask in this tap. See [Tap Trust](https://docs.brew.sh/Tap-Trust).

| Cask | App |
|---|---|
| `randomtask` | [randomtask](https://github.com/davidswords/randomtask), a minimal, client-side encrypted todo app. Formerly `randomnote`; `brew upgrade` moves existing installs over. Also installs a `randomtask` command that opens the app. |
