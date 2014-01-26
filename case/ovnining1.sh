#!/bin/bash 
# Falade Olumuyiwa Lx13  Written 01/12/2014
# uppgift 1 på Tentan
#
# This scripts checks the disk useage for your system. But you need to have 
# copied the result of "df -h" into a file named "disk.txt". it is from
# this file the this script reads its input.

funk () { 
    if [ ${barray[$a]} -gt 20 ]; then
        echo -e "Utrymmet i ${carray[$a]} är ${barray[$a]}% full!"
    fi
}

carray=( `cat $HOME/disk.txt|awk '{print $1}'` ) # Array till Utrymmet
barray=( `cat $HOME/disk.txt|awk '{print $5}' | cut -d'%' -f1` ) # Array till Användning

# Skips the first Item [0] in the list to avoid the headline
for (( a=1; a<${#carray[@]}; a++ )); do # a compare to the number of element in the array
    funk 
done
    
 exit 0

