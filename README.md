# davidswords/homebrew-tap

Homebrew casks for apps by [Swords Engineering](https://swords.engineering).

## Install

```
brew tap davidswords/tap
brew trust --cask davidswords/tap/randomnote
brew install randomnote
```

Homebrew requires you to trust casks from third-party taps before it uses them. `brew trust --cask` trusts only the named cask. `brew trust davidswords/tap` trusts every current and future cask in this tap. See [Tap Trust](https://docs.brew.sh/Tap-Trust).

| Cask | App |
|---|---|
| `randomnote` | [randomnote](https://github.com/davidswords/randomnote), a minimal, client-side encrypted todo app |
