#!/bin/bash
echo "Your Argument is:$1"
if [ $# -eq 1 ]; then
    echo "You need one Parameter!"
elif [ $# -gt 1 ]; then
    echo -e "your parameter is: $1 $2 $3 \n"
    echo $0
    echo $*
fi
exit 0

