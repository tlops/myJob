#!/bin/bash
#
#
function Add {
    sum=$(( $Nr1 + $Nr2 ))
    echo "$Nr1 + $Nr2 = $sum"
}

function Minus {
    diff=$(( $Nr1 - $Nr2 ))
    echo "$Nr1 - $Nr2 = $diff"
}

function Multi {    #Multiplication Function
    prod=$(( $Nr1 * $Nr2 ))
    echo "$Nr1 * $Nr2 = $prod"
}

Divide () {         # divide function
    kvot=$( bc -l <<< "scale=3; $Nr1/$Nr2" )
    echo "$Nr1 / $Nr2 = $kvot"
}


read -p "Enter two Numbers: " Nr1 Nr2
Add $Nr1 $Nr2
Minus $Nr1 $Nr2
Multi $Nr1 $Nr2
Divide $Nr1 $Nr2
exit 0
