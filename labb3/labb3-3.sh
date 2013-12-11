#!/bin/bash
# Kontrollera om ange tal är mellan 1 och 10
read -p "Skriv en heltal mellan 1-10!" Num
if [ "$Num" -le 10 -a "$Num" -ge 1 ]; then
    echo "$Num godkänn!"
else
    echo "$Num Inte godkand!"
fi
exit 0
