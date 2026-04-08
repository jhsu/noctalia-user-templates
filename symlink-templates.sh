#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/templates"
TARGET_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/noctalia/templates"

mkdir -p "$TARGET_DIR"

shopt -s nullglob
templates=("$SOURCE_DIR"/*)

files=()
for template in "${templates[@]}"; do
  if [ -f "$template" ] || [ -L "$template" ]; then
    files+=("$template")
  fi
done

if [ ${#files[@]} -eq 0 ]; then
  echo "No template files found in $SOURCE_DIR"
  exit 0
fi

for template in "${files[@]}"; do
  target="$TARGET_DIR/$(basename "$template")"
  if [ -e "$target" ] || [ -L "$target" ]; then
    echo "Warning: $target already exists; skipping"
    continue
  fi

  ln -s "$template" "$target"
  echo "Linked $target -> $template"
done

echo "Done. Linked ${#files[@]} template file(s) into $TARGET_DIR"
