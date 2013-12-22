#!/bin/bash

echo "vad har du till favorit färg?"
read -t 5 Farg # väntar 5 sec för att ta värdet till Farg

if [ -z $Farg ]; then   # om Farg har inget värde från användare
    echo "ditt favorit färg är röd!"    # skriv ut rod!
else             # Annars
    echo "din Favoritfärg är: $Farg!" # skriv ut värdet från användare
fi      # stangt if statement

exit 0  #Avsluta
