#!/bin/sh
#
# This Script Checks disk usage and sends a notification if any disk is
# above 80% utilization, it send an email to the administrator.
# $Output: shows the df -H with the first and fifth fields; filesystem & use.
# $Useage: greps the use field without the percentage (%) sign.
# $Partition: greps the filesystem field.
# 
# Falade olumuyiwa LX13
# Case 7.
#
Output=$(df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $1 "\t\t " $5 }')
declare -a Percentage=($( df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 }' | cut -d'%' -f1 )) 
declare -a Partition=($( df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $1 }') )

echo -e "$Output \n"

        for i in ${!Partition[@]}; do
           if [ ${Percentage[$i]} -gt 80 ]; then
                 echo "Running out of space \"${Partition[$i]} (${Percentage[$i]}%)\" on $(hostname) as on $(date)" |
                 mail root -s "Disk Status Alert!" 
           fi
        done
sleep 6
clear
exit 0
