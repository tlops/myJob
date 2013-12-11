#!/bin/bash
#Skript som visa vilken typ av fi( vanling fil, katalog m.m)

Filname=$1;   #tar argument från tangentbord

if [ ! -e $Filname ]; then
    echo "filen finns inte! försök igen!"
    exit
fi

if [ -d $Filname ]; then
    echo "$Filname är en Katalog!"

elif [ -b $Filname ]; then
    echo "$Filname är en block device!"

elif [ -h $Filname ]; then
    echo "$Filname är en länk!"

else 
    echo "$Filname är en vanlig fil"
fi

exit 0

