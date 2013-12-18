#!/bin/bash
# This skript takes in two integer and 
# performs basic arithmethic operations
# on them
# Falade Olumuyiwa Lx13
# Labb 4 uppgift 1
read -p "Skriv två heltal: " Tal1 Tal2
let sum="Tal1+Tal2"
let diff="Tal1-Tal2"
let mul="Tal1*Tal2"
let div="Tal1/Tal2"
let rest="Tal1%Tal2"

echo "$Tal1 + $Tal2 = $sum"
echo "$Tal1 - $Tal2 = $diff"
echo "$Tal1 * $Tal2 = $mul"
echo "$Tal1 / $Tal2 = $div: rest:$rest "

exit 0
