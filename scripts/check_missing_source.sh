#!/bin/bash

# Directory where move_top.sh was run
SOURCE_DIR="$1"

if [[ -z "$SOURCE_DIR" ]]; then
  echo "Usage: $0 <source_dir>"
  exit 1
fi

# .png.txt in 0,A-Z with no matching .png in SOURCE_DIR
echo "=== .png.txt with no matching source file ==="
for dir in 0 {A..Z}; do
  [[ -d "$dir" ]] || continue
  for txt in "$dir"/*.png.txt; do
    [[ -f "$txt" ]] || continue
    base=$(basename "$txt" .txt)
    if ! find "$SOURCE_DIR" -name "$base" -print -quit | grep -q .; then
      echo "$txt"
    fi
  done
done
