#!/bin/bash
# This script backs up a file or directory and stores the compressed
# version in home/PALL/backup directory. It uses the users name and 
# date to store the compressed file. Checks if a similar file exists
# and give option to overwrite or save with a new name.
#
# Falade Olumuyiwa LX13
# labb5 uppgift 5

if [ -z "$1" ]; then # checks if the argument is supplied, that is;
                    # the file to be compressed! if not?
    echo "usage: $0 directory"
fi

SRCD=$1     # file to be compressed
TGTD="$HOME/PALL/Backup/"   # destination where the new file is saved
if [ ! -e $TGTD ]; then  # if the path does not exist
     mkdir -p $TGTD         # create the path
elif [ ! -r $TGTD ] && [ ! -w $TGTD ]; then # is the path read- or wri
                                            # teable?
     echo "This destination destination is not read or Writeable!"
else
    OF="$USER-$(date +%Y-%m-%d).tar.gz" # the compressed file's name
    tar -cpzf $TGTD$OF $SRCD # actual compression of the file
    if [ -e $TGTD$OF ]; then # if the file exists notify user!!
        echo "The file exists!"
        read -p "Do you want to Overwrite it! [Y/N]" Ans
        case $Ans in # options to overwrite or rename file
            [yY])       # yes overwrite
                tar -cpzf $TGTD$OF $SRCD
                ;;

            [nN])       # No save with a new name
                OF="home-$(date +%Y-%m-%d-%H-%M).tar.gz"
                tar -cpzf $TGTD$OF $SRCD
                ;;

            *) echo "Enter Y or N!"
        esac
    fi


fi

