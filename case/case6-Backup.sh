#!/bin/bash
#
# Case 6: Läsa information from en hostlist och gå genom
# alla rad på listan för att testa om hosten är upp eller
# inte!
#
# Falade Olumuyiwa Lx13
# Case
#
#
if [ $EUID -ne 0 ]; then
   zenity --error --text="Contact your administrator to run This Check!"
#    echo "Condtact your ADMIN!"
exit 2
fi

# Checks for the hostlist
if [ ! -e hostlist.txt ]; then
    zenity --error --text="Check for the Hostlist"
exit 2
fi


declare -a Name=( `cat hostlist.txt | awk '{ print $1 }'` )
declare -a List=( `cat hostlist.txt | awk '{ print $2 }'` )
# Test function performs ping and tests the 
# exit value if its 0.

Test () { 
    ping -c 1 ${List[$i]} &>/tmp/test
    if [ $? -eq 0 ]; then
       echo -e "${Name[$i]} \t ${List[$i]} \t \e[32mUp\e[0m"  # prints Up in green
      # echo -e "${Name[$i]} \t ${List[$i]} \t Up" >> /tmp/display # prints Up in green
    else
       echo -e "${Name[$i]} \t ${List[$i]} \t \e[31mDown\e[0m" # prints Up in green
       #echo -e "${Name[$i]} \t ${List[$i]} \t Down" >>/tmp/display # prints Up in green
    fi
    rm /tmp/test
}


echo -e "Hostname \tIP \tStatus" # >/tmp/display
echo "-------------------------------------" # >> /tmp/display

# Checks the list Hostlist for IPs
    for i in ${!Name[@]}; do
        Test ${List[$i]}
    done
sleep 5
  clear
exit 
