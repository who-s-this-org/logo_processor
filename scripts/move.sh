for dir in {A..Z}; do
  mkdir -p "$dir"
done
mkdir -p 0

move_file() {
  local file="$1"
  local dest_dir="$2"
  local base="${file%.*}"
  local ext="${file##*.}"

  if [[ "$base" == "$file" ]]; then
    ext=""
  fi

  local target="$file"
  local counter=1
  while [[ -e "$dest_dir/$target" ]]; do
    if [[ -n "$ext" ]]; then
      target="${base}_${counter}.${ext}"
    else
      target="${base}_${counter}"
    fi
    ((counter))
  done

  mv "$file" "$dest_dir/$target"
}

# Move files into directories named after the first letter
for file in *; do
  if [[ -f "$file" ]]; then
    first_char=$(echo "$file" | head -c 1 | tr '[:lower:]' '[:upper:]')
    if [[ "$first_char" =~ [A-Z] ]]; then
      move_file "$file" "$first_char"
    elif [[ "$file" =~ ^[0-9] ]]; then
      move_file "$file" "0"
    fi
  fi
done
