#!/bin/bash

Srcfil=$1
Name=$( basename $Srcfil )
Zipname="$Name-$( date +%Y-%m-%d ).tar.gz"
RmtCp="scp -r tlops@83.177.199.9:~/$Srcfil /tmp/Backup"
Dest="$HOME/tmp/Backup" #

if [ $EUID -eq 0 ]; then
    echo -e "Copying files ...\n"
    $Rmtcp
    if [ $? -eq 0 ]; then
        echo "Copying is successful!"
        tar -cpzf $Dest$Zipname $Srcfil
        if [ $? -eq 0 ]; then
            echo -e "\n Your file is successfully backed up!"
        else
            echo "File: $Srcfil Could not be backed up!!"
            exit 1
        fi
    else
        echo "File: $Srcfil could not be copied!"
        echo "Check that the file or network connection exists!"
        exit 1
    fi
else
    echo "Contact your ADMINISTRATOR to run this command!"
    exit 1
fi
exit 0
    




