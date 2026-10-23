#!/usr/bin/env bash
# Audits a cask, then installs and fully uninstalls it.
# Usage: test-cask.sh <cask-name>
set -euo pipefail

cask="davidswords/tap/$1"
brew trust --cask "$cask"
brew audit --cask --strict --online "$cask"
brew install --cask "$cask"
if [ "$1" = randomtask ]; then
  # The randomtask command opens the installed app.
  command="$(command -v randomtask)"
  test -x "$command"
  grep -qx 'exec open -a "/Applications/randomtask.app"' "$command"
fi
brew uninstall --cask --zap "$cask"
