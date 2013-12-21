#!/bin/bash
# This Script prints lines the number of times 
# the user specifies.
#
# Falade Olumuyiwa LX13
# labb 6 uppgift 3

function linje {
i=0
    while [ $i -lt $Num ]; do
        echo "***************************************"
        (( i++ ))
    done
exit 0 
}

read -p "Enter an integer!" Num
linje $Num
