#!/bin/bash
#
# Falade Olumuyiwa Lx13
# Case 6 and 9
# 
#
# This section of divides the content of the hostlist.txt
# into three arrays: Name, IpAdd; Web for Hostname, IP add-
# ress and web file.

if [ ! -e hostlist.txt ]; then
    echo "The file hostlist does not exist, You need "
    echo "   To have it to run this script!!!"
    exit 1
fi

declare -a Name=( `cat hostlist.txt | awk '{ print $1 }'` )
declare -a IpAdd=( `cat hostlist.txt | awk '{ print $2 }'` )
declare -a Web=( `cat hostlist.txt | awk '{ print $3 }'` )

# This fxn runs the wget, pipe the result to /dev/null
# and stores the exit value in "result" for later use.

Webstatus () {
    wget -t 1 -T 1 ${IpAdd[$i]}/${Web[$i]} &>/dev/null
    result=$?
}
#
# Test function performs ping and tests the exit value if its 0. 
# It also tests the value of "result" in the webstatus fxn
Test () { 
    ping -c 1 -w 1 ${IpAdd[$i]} &>/dev/null
    if [ $? -eq 0 ]; then
        echo -en "${Name[$i]} \t ${IpAdd[$i]} \t \e[32mUp\e[0m" # prints Up in green 'n' puts the prompt on same line
    else
        echo -en "${Name[$i]} \t ${IpAdd[$i]} \t \e[31mDown\e[0m" # Prints down in red
    fi

    # This section tests the value of result in webstatus
        if [ $result -eq 0 ]; then
            echo -e "\t\t \e[32mUp\e[0m" # prints Up in green
        else
            echo -e "\t\t \e[31mDown\e[0m" # prints Up in red
        fi

    }


echo -e "Hostname \tIP \tStatus \t\twww"
echo "----------------------------------------------"

# Checks the list Hostlist for IPs
for i in ${!Name[@]}; do # Checks the indexes -i- for the arrays and
    Webstatus # ${IpAdd[$i]}/${Web[$i]} # loops through the corresponding
    Test ${IpAdd[$i]} # elements of each array.

done
rm index.html* # removes all downloaded index files.
    sleep 6
    clear
exit 0

