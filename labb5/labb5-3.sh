#!/bin/bash
# This skript tests if the file "while.dat"
# exists and if it does not it will wait till 
# it is created or the program is halted!
# Falade Olumuyiwa 
# LX13
# Labb5 uppgift 3
#
# While loop!
while [ ! -e $HOME/while.dat ]; do # om filen finns inte 
    :                               # inget
done
echo "Filen finns!!" # När filen finns eller är skapat
#
#
# Same program with until loopi!
until [ -e ~/data.dat ]; do
    :
done
    echo "File exists!"

