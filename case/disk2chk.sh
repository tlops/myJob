#!/bin/bash 
# Falade Olumuyiwa Lx13  Written 01/26/2014
#
# This scripts checks the disk useage for your system. But you need to have 
# copied the result of "df -h" into a file named "disk.txt". it is from
# this file the this script reads its input.
#
# Victor's Solution

funk () {
    var=$5 # the fifth row
    if [ ${var%?} > 20 ]; then  #%? removes the % sign
        echo $1 $5
    fi
}
array=(`cat $HOME/disk.txt | awk '{print $1}' | sed -n '2,$p'`) #make an array from the first row "Filesystem"
i=0
for a in ${array[*]}; do # for a inthe number of element; do
    brray[$i]=`cat $HOME/disk.txt | grep $a` # greps the each row and made a new array brray.
    ((i++))
done

for b in {0..6}; do
    funk ${brray[$b]}
done

exit 0
