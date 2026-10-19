#!/bin/sh
# GTK's @import is unreliable in waybar/wofi (especially through stow symlinks),
# so inline the shared palette (theme/mocha.css) into their stylesheets.
# Run after editing mocha.css. Everything between the markers is replaced.
d=$(dirname "$(readlink -f "$0")")
for f in "$d/../waybar/style.css" "$d/../wofi/style.css"; do
  awk -v pal="$d/mocha.css" '
    /^\/\* BEGIN palette/ { print; while ((getline l < pal) > 0) if (l ~ /^@define-color/) print l; skip=1; next }
    /^\/\* END palette/ { skip=0 }
    !skip { print }' "$f" > "$f.tmp" && mv "$f.tmp" "$f"
done
