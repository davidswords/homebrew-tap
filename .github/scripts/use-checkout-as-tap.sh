#!/usr/bin/env bash
# Makes Homebrew load davidswords/tap from this checkout.
set -euo pipefail

tap_dir="$(brew --repository)/Library/Taps/davidswords/homebrew-tap"
mkdir -p "$(dirname "$tap_dir")"
ln -s "$GITHUB_WORKSPACE" "$tap_dir"
