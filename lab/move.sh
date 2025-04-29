#!/bin/bash
mkdir -p review
find . -maxdepth 1 -type f -name "*.pdf" -exec mv {} review/ \ ;
echo "file moved"
