#!/bin/bash
# This code shows syntax for 
# For, while and until loop
#
# For Loop
#       for i in 1 2 3 4 5; do
#           echo  $i
#       done 
#       echo "" # empty line

# While Loop: as long as the 
# condition is true it will loop!
#       b=10
#       while [ $b -gt 0 ]; do
#           echo $b
#           ((b--))
#       done
#        echo ""
#
#
# Until Loop: is going to iterate until 
# the condition is true!
#        var=10
#        until [ $var -lt 0 ]; do
#        echo $var
#        ((var--)) 
#        done


## A new code

if [ -z "$1" ]; then 
    echo "usage: $0 directory"
fi

SRCD=$1
TGTD="$HOME/PALL/Backup/"
if [ ! -e $TGTD ]; then
     mkdir -p $TGTD    
elif [ ! -r $TGTD ] && [ ! -w $TGTD ]; then
     echo "This destination destination is not read or Writeable!"
else
    OF="$USER-$(date +%Y-%m-%d).tar.gz"
    tar -cpzf $TGTD$OF $SRCD
    if [ -e $TGTD$OF ]; then
        echo "The file exists!"
        read -p "Do you want to Overwrite it! [Y/N]" Ans
        case $Ans in
            [yY]) 
                tar -cpzf $TGTD$OF $SRCD
                ;;

            [nN])
                OF="home-$(date +%Y-%m-%d-%H-%M).tar.gz"
                tar -cpzf $TGTD$OF $SRCD
                ;;

            *) echo "Enter Y or N!"
        esac
    fi


fi

