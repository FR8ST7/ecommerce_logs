#!/bin/bash
mkdir -p review
find . -maxdepth 1 -type f -name "*.log" -exec mv {} review/ \;
echo "files moved.."
