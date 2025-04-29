#!/bin/bash
mkdir -p review
find . -maxdepth 1 -type f -name "*.pdf" -exec mv {} review/ \;
count=$(ls review/*.pdf 2>/dev/null | wc -l)
echo "files moved:$count"
echo "file moved"
