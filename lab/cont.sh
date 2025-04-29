#!/bin/bash
count=$(ls lin/*.log 2>/dev/null | wc -l)
echo "no. of log files:$count"
