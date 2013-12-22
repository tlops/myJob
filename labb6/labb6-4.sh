#!/bin/bash
#
#
function add {
    sum=$(( $Nr1 + $Nr2 ))
    echo "$Nr1 + $Nr2 = $sum"
}

function minus {
    diff=$(( $Nr1 - $Nr2 ))
    echo "$Nr1 - $Nr2 = $diff"
}

read -p "Enter two Numbers: " Nr1 Nr2
add $Nr1 $Nr2

read -p "Enter two Numbers: " Nr1 Nr2
minus $Nr1 $Nr2
echo $# $*

