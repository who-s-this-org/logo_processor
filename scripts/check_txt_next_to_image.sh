#!/bin/bash

# .png.txt or .jpg.txt next to a matching image in 0,A-Z
echo "=== .txt files next to matching image ==="
for dir in 0 {A..Z}; do
  [[ -d "$dir" ]] || continue
  for txt in "$dir"/*.png.txt "$dir"/*.jpg.txt; do
    [[ -f "$txt" ]] || continue
    base=$(basename "$txt" .txt)
    if [[ -f "$dir/$base" ]]; then
      echo "$txt (alongside $dir/$base)"
    fi
  done
done
