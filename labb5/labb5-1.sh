#!/bin/bash
# This code takes in a number between 
# 10 and 100 and counts down to 1 using
# Until loop for iteration!
# Author: Falade Olumuyiwa
# Class: LX13
# Labb 5 uppgift 1

echo "enter a number between 10 and 100!"
read Num
echo ""     # Empty Line
# Test for the range of allowed integers 10-100
if [ "$Num" -le 100 -a "$Num" -ge 10 ]; then
    until [ $Num -lt 1 ]; do # it runs until the value of Num is 1
        echo $Num # prints the value of  Num
        ((Num--))  # subtracts 1 from the value of Num
    done
else
    echo "Enter a number within the Range 10-100!"
fi

exit 0
