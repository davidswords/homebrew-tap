#!/usr/bin/env bash
# Updates every cask whose upstream has a newer release, in place.
# Prints the name of each updated cask, one per line.
set -euo pipefail

for file in Casks/*.rb; do
  name="$(basename "$file" .rb)"
  cask="davidswords/tap/$name"
  brew trust --cask "$cask" >&2

  check="$(brew livecheck --cask --json "$cask")"
  if [ "$(jq -r '.[0].version.outdated' <<<"$check")" != "true" ]; then
    echo "$name is up to date" >&2
    continue
  fi

  latest="$(jq -r '.[0].version.latest' <<<"$check")"
  echo "Updating $name to $latest" >&2
  brew bump-cask-pr --write-only --no-audit --no-style --version "$latest" "$cask" >&2
  echo "$name"
done
