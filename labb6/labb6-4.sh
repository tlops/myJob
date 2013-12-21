#!/bin/bash
#
#
function add { 
    sum=$[ $Nr1 + $Nr2 ]
    return $sum
}

read -p "Enter two Numbers" Nr1 Nr2
echo "$add"

