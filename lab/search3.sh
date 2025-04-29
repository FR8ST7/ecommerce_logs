#!/bin/bash
count=$(ls lab/*.csv 2>/dev/null | wc -l)
echo "no. of csv files:$count"
