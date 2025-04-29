#!/bin/bash

echo "enter word"
read str

rev_str=$(echo "$str" | rev)

if [ "$str" = "$rev_str" ]; then
echo "palindrome"
else
echo "not paindrome"
fi
