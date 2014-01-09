#!/bin/bash
#
# Case 6: Läsa information from en hostlist och gå genom
# alla rad på listan för att testa om hosten är upp eller
# inte!
#
# Falade Olumuyiwa Lx13
# Case
declare -a Name=( `cat hostlist.txt | awk '{ print $1 }'` )
declare -a List=( `cat hostlist.txt | awk '{ print $2 }'` )
# Test function performs ping and tests the 
# exit value if its 0.

Test () { 
    ping -c 1 ${List[$i]} > /tmp/test 2> /tmp/test
    if [ $? -eq 0 ]; then
        echo -e "${Name[$i]} \t ${List[$i]} \t \e[32mUp\e[0m" # prints Up in green
    else
        echo -e "${Name[$i]} \t ${List[$i]} \t \e[31mDown\e[0m" # Prints down in red
    fi
    rm /tmp/test
}


echo -e "Hostname \tIP \tStatus"
echo "-------------------------------------"

# Checks the list Hostlist for IPs
for i in ${!Name[@]}; do
    Test ${List[$i]}

done
