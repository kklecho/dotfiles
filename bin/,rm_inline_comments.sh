#!/bin/bash

# Remove inline comments from files without creating .bak files
# Usage: ./rm_inline_comments.sh <file1> <file2> ...

for file in "$@"; do
    if [ -f "$file" ]; then
        # Use sed to remove inline comments and overwrite the file directly
        sed -i -e 's|//.*$||' -e 's|/\*.*\*/||' "$file"
    else
        echo "File not found: $file"
    fi
done
