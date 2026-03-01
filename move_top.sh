for file in *; do
  if [[ -f "$file" ]]; then
    file_name=$(basename "$file")
    echo "$file" >> "$file_name.txt"
    echo "- TOP_" >> "$file_name.txt"
  fi
done
