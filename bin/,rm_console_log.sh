#!/usr/bin/env bash

# Script to remove console.log statements from JavaScript files
# Usage: ./util_no_console_log.sh <file.js> [file2.js ...]

if [ $# -eq 0 ]; then
    echo "Error: No files provided."
    echo "Usage: $0 <file.js> [file2.js ...]"
    exit 1
fi

for file in "$@"; do
    if [ ! -f "$file" ]; then
        echo "Error: File '$file' does not exist."
        continue
    fi
    
    # Use awk to remove lines containing console.log
    awk '!/console\.log/' "$file" > "${file}.tmp" && mv "${file}.tmp" "$file"
    awk '!/console\.info/' "$file" > "${file}.tmp" && mv "${file}.tmp" "$file"
    
    echo "Removed console.log statements from: $file"
done

echo "Done."
