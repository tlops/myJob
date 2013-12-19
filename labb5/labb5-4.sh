#!/bin/bash
#
# This Scripts reads in the scores (Value) of an examination
# from a file: betyg.txt, sums the marks and grade the student
# On the scale > 48: VG,  > 30:G,  < 30:IG
# Falade Olumuyiwa LX13
# labb5 uppgift 4
if [ ! -e betyg.txt ]; then # Tests if the file exists
    echo "filen finns inte!"
else 
     test=$( cat betyg.txt ) # Copies the content of 
                            # the file to test.
fi
# echo $test
for i in $test; do  # the counter "i" goes through 
                    # each element of test
    point=$[ $point + $i ] # adds the value on each line
                          # and stores the sum in "point"
done
    echo "Your score is : $point! " # Total points
if [ "$point" -ge 48 ]; then
    echo "Contgratulations you have: VG!"
elif [ "$point" -ge 30 ]; then
    echo "Congratulations You have: G!"
else
    echo "You need to seat up: IG"
fi
exit 0

