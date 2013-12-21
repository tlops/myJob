#!/bin/bash
# This script takes two arguments and 
# print out the sum.
#
# Falade Olumuyiwa lX13
# labb 6 uppgift 1
echo "Your Argument is:$1 + $2"
if [ $# -eq 2 ]; then # chks that two arguments are entered
    sum=$(( $1 + $2 )) # sums them
    echo "Sum= $sum "
else 
    echo -e "you need to enter two arguments \n"
fi
exit 0

