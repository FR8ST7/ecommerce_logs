#!/bin/bash
count=$(ls *.c 2>/dev/null | wc -l)
echo "No. of files:$count"
