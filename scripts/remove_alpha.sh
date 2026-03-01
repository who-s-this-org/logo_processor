for file in *; do
  if [[ -f "$file" ]]; then
    file_name=$(basename "$file")
    magick "${file}" -background white -alpha remove -alpha off "${file_name}_alpha.png"
  fi
done
