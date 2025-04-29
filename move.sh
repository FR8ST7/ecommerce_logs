#!/bin/bash
find lin -type f -name "*.pdf" -exec mv {} review/\ ;
echo "file moved"
