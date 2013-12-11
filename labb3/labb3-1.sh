#!/bin/bash

read -p "Ange två heltal:" Tal1 Tal2 # ta två heltal i Tal1 & Tal2
    if [ "$Tal1" -eq "$Tal2" ]; then # om dem bli lika

        echo "$Tal1 är lika med $Tal2!" # Skriv
    
    elif [ "$Tal1" -ne "$Tal2" ]; then  # annars om dem är in lika
         echo "$Tal1 är inte lika med $Tal2!"   # skriv ut
     fi             # stäng vilkor

if [ "$Tal1" -lt "$Tal2" ]; then
        echo "$Tal1 är mindre än $Tal2!"

    elif [ "$Tal1" -gt "$Tal2" ]; then
        echo "$Tal1 är större än $Tal2! "
  
  
    fi
    exit 0 
