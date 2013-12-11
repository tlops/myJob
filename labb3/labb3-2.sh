#!/bin/bash
#Kontrollera om en fil finns och läsbära!

if [ -e ./namn.txt ]; then
    echo "filen finns!"
else
    echo "filen finns inte!"
fi

# testa om det är skrivbar
if [ -w ./namn.txt ]; then
    echo "Det är skrivbar!"
else 
    echo "Det är inte Skrivbar!"
fi

#testa om det är läsbar
if [ -r ./namn.txt ]; then
    echo "Det är läsbar!"
else 
    echo "Det är inte läsbar!"
fi

exit 0
