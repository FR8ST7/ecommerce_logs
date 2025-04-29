#!/bin/bash

echo "enter num1:"
read a
echo "enter +,-,*,/:"
read op
echo "enter num2:"
read b

result=$(echo "$a $op $b" | bc -l)
echo "result:$result"
