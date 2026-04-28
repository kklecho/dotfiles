#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 file1 [file2 ...]"
    exit 1
fi

for file in "$@"; do
    if [ ! -f "$file" ]; then
        echo "Error: File '$file' does not exist."
        continue
    fi

    # Remove all trailing lines that are whitespace-only
    sed -i ':a; /^[[:space:]]*$/ { $d; N; ba }' "$file"

    echo "" >> "$file"
done

