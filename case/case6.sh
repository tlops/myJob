#!/bin/bash
#
# Case 6 and 9
#
# This section of divides the content of the hostlist.txt
# into three arrays: Name, List; Web for Hostname, IP add-
# ress and web file.
declare -a Name=( `cat hostlist.txt | awk '{ print $1 }'` )
declare -a List=( `cat hostlist.txt | awk '{ print $2 }'` )
declare -a Web=( `cat hostlist.txt | awk '{ print $3 }'` )

# This fxn runs the wget, pipe the result to /dev/null
# and stores the exit value in "result" for later use.

Webstatus () {
    wget -t 1 -T 1 ${List[$i]}/${Web[$i]} &>/dev/null
    result=$?
}
#
# Test function performs ping and tests the exit value if its 0. 
# It also tests the value of "result" in the webstatus fxn
Test () { 
    ping -c 1 -w 1 ${List[$i]} &>/dev/null
    if [ $? -eq 0 ]; then
        echo -en "${Name[$i]} \t ${List[$i]} \t \e[32mUp\e[0m" # prints Up in green 'n' puts the prompt on same line
    else
        echo -en "${Name[$i]} \t ${List[$i]} \t \e[31mDown\e[0m" # Prints down in red
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
    Webstatus ${List[$i]}/${Web[$i]} # loops through the corresponding
    Test ${List[$i]} # elements of each array.

done
rm index.html* # removes all downloaded index files.
exit 0

