#!/bin/sh
Percentage=$( df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 }' | cut -d'%' -f1 ) 
Partition=$( df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $6 }') 

for i in $Percentage; do
    (( i++ ))
    if [ $i -ge 20 ]; then
        echo "Running out of space  ($i%) on $(hostname) as on $(date)"
        #echo "$Percentage  $Partition "
    else
        echo "$( df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' )"
    fi
done

#while read output; do
 #     echo $output

