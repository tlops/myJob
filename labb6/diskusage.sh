#!/bin/sh
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output; do
      echo $output
      useage=$( echo $output | awk '{ print $1}' | cut -d'%' -f1  )
      partition=$( echo $output | awk '{ print $2 }' )
      if [ $useage -ge 20 ]; then
         echo "Running out of space \"$partition ($useage%)\" on $(hostname) as on $(date)"  |
         mail -s "Alert: Almost out of disk space $useage%" tlops@ubuntu
      fi
done
