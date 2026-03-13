#!/bin/bash

# Directory where move_top.sh was run
SOURCE_DIR="$1"

if [[ -z "$SOURCE_DIR" ]]; then
  echo "Usage: $0 <source_dir>"
  exit 1
fi

# .png in SOURCE_DIR with no matching .png.txt in 0,A-Z
echo "=== Source files with no matching .txt ==="
find "$SOURCE_DIR" -type f \( -name '*.png' -o -name '*.jpg' \) | while read -r file; do
  base=$(basename "$file")
  first_char=$(echo "$base" | head -c 1 | tr '[:lower:]' '[:upper:]')

  if [[ "$first_char" =~ [A-Z] ]]; then
    dest_dir="$first_char"
  elif [[ "$first_char" =~ [0-9] ]]; then
    dest_dir="0"
  else
    continue
  fi

  if [[ ! -f "$dest_dir/${base}.txt" ]]; then
    echo "$file (expected $dest_dir/${base}.txt)"
  fi
done
