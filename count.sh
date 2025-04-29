#!/bin/bash
count=$(ls lab/*.c 2>/dev/null | wc -l)
echo "No. of files: $count"

