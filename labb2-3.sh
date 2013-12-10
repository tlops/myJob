#!/bin/bash

echo "Vad heter du? " # förfrågan på skärmen
echo " "                # töm rad
read Namn               # tar data från användare via tangentbordet
    echo $Namn >>namn.txt   # skriv ut värdet till namn til filen namn.txt
    echo ""
    echo -n  "Listan är: "
    cat namn.txt        #visar upp listan!
    exit 0              # exit
