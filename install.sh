#!/bin/bash
# Link keyguide into ~/.local/bin and copy the example guides you don't have yet
# into ~/.config/keyguides (yours are never overwritten). Re-running is safe.
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")"
GUIDES="${XDG_CONFIG_HOME:-$HOME/.config}/keyguides"
mkdir -p "$HOME/.local/bin" "$GUIDES"
chmod +x keyguide
ln -sfn "$(pwd)/keyguide" "$HOME/.local/bin/keyguide"
for f in examples/*.tsv; do
  [[ -e $GUIDES/$(basename "$f") ]] || cp "$f" "$GUIDES/"
done
echo "keyguide -> $HOME/.local/bin/keyguide; guides in $GUIDES"
