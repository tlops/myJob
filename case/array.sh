#!/bin/bash
#
# Denna skript "leka med" array och for-loop
#
#### Deklarera Listan #######
myArray=( Johan Skåne Lagos Halmstad Helsinborg Abuja "New york")
Population=( 123 342 234 345 230 999 888 )

#### skriver ut innehållet till lister och deras Plats i listan
for i in ${!myArray[@]}; do
    echo -e "$i ${myArray[$i]} ${Population[$i]}" 
done

echo " " ##Mellanrum
#
# kolla i värje plats
for b in ${!Population[@]}; do
    if [ ${Population[$b]} -gt 300 ]; then
        echo "$b ${myArray[$b]} ${Population[$b]}"
    fi
    ((b++))
done
echo ""
for ((co=0; co<${#myArray[@]};co++)); do
   if [ ${Population[$co]} -gt 300 ]; then 
        printf "%s har %d invånare\n" "${myArray[$co]}" "${Population[$co]}";
    fi
done 

####### More Lists #################
echo ""
IpList=(`cat hostlist.txt | awk '{print $2}'`)
NewList=(`cat hostlist.txt | awk '{print $1}'`)
    for df in ${!NewList[@]}; do
        echo ${NewList[$df]} "  " ${IpList[$df]}
    done
