#!/bin/sh
#
# This Script Checks disk usage and sends a notification if any disk is
# above 80% utilization, it send an email to the administrator.
# $Output: shows the df -H with the first and fifth fields; filesystem & use.
# $Useage: greps the use field without the percentage (%) sign.
# $Partition: greps the filesystem field.
# 
# Falade olumuyiwa LX13
# Labb6 uppgift 4
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read Output; do
      echo $Output
      Useage=$( echo $Output | awk '{ print $1}' | cut -d'%' -f1  )
      Partition=$( echo $Output | awk '{ print $2 }' )
      if [ $Useage -ge 80 ]; then # Tests the Usage
         echo "Running out of space \"$Partition ($Useage%)\" on $(hostname) as on $(date)"  |
         mail -s "Alert: Almost out of disk space $Useage%" tlops@ubuntu
     fi
done
