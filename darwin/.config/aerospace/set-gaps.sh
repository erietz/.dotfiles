#!/usr/bin/env bash
# Set aerospace [gaps] values and reload config.
# Usage: set-gaps.sh <inner-h> <inner-v> <outer-h> <outer-v>
#   outer-h sets outer.left and outer.right
#   outer-v sets outer.top  and outer.bottom
set -euo pipefail

if [[ $# -ne 4 ]]; then
    echo "Usage: $0 <inner-h> <inner-v> <outer-h> <outer-v>" >&2
    exit 1
fi

config="$HOME/.config/aerospace/aerospace.toml"

# Write through a temp file and `cat >` back so the inode (and any hardlink
# or symlink to the dotfiles repo) is preserved.
tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT

INNER_H="$1" INNER_V="$2" OUTER_H="$3" OUTER_V="$4" \
perl -pe '
    s/^(\s*inner\.horizontal\s*=\s*)\d+/$1$ENV{INNER_H}/;
    s/^(\s*inner\.vertical\s*=\s*)\d+/$1$ENV{INNER_V}/;
    s/^(\s*outer\.(left|right)\s*=\s*)\d+/$1$ENV{OUTER_H}/;
    s/^(\s*outer\.(top|bottom)\s*=\s*)\d+/$1$ENV{OUTER_V}/;
' "$config" > "$tmp"

cat "$tmp" > "$config"

aerospace reload-config
