#!/bin/bash
# This code does basic Arithmetic
# Operations including factorial!
# Falade Olumuyiwa Lx13
# Labb 4 upgift 3
echo "--------------------------------"
echo "|  This is a Calculator made   |"
echo "|                              |"
echo "|          in BASH!            |"
echo "|______________________________|"
echo ""
echo "| Enter your first Number and  |"
echo "|      press Enter!!           |"
read -p "|             " N1      # first input 
read -p "|             " Opr     # Operand + -/ *
factorial=1

    case $Opr in # tests the operand
        [+] )   # if operand = + do
            echo "| Enter  Your second Number    |"
            echo "|     and press Enter!         |"
            read -p "|             " N2     # second input
            Sum=$(bc -l <<< "scale=6; $N1+$N2") # sum piped to bc calc
            echo -e "\n|         $N1 + $N2 = $Sum          |" # Output
            echo "|______________________________|"
            
            ;; # end of case 1

        [-] )
            echo "| Enter  Your second Number    |"
            echo "|     and press Enter!         |"
            read -p "|             " N2
            Sub=$(bc -l <<< "scale=6; $N1-$N2")
            echo -e "\n|   $N1 - $N2 = $Sub         |"
            echo "|______________________________|"
                                                        
            ;;

         [*] )
            echo "|  Enter  Your second Number   |"
            echo "|      and press Enter!        |"
            read -p "|             " N2
            Mul=$(bc -l <<< "scale=6; $N1*$N2")
            echo -e "\n|           $N1 * $N2 = $Mul        |"
            echo "|______________________________|"

            ;;

         [/] )
            echo "|  Enter  Your second Number   |"
            echo "|      and press Enter!        |"
            read -p "|             " N2
            Div=$(bc -l <<< "scale=6; $N1/$N2")
            echo -e "\n|           $N1 / $N2 = $Div        |"
            echo "|______________________________|"

            ;;

        !)
        saved=$N1 # This stores the initial value of
                    # N1 so it can be used in the 
                    # on screen display!
        while [ $N1 -gt 0 ]; do
            factorial=$(( $factorial * $N1 ))
            N1=$(( $N1 - 1 ))
            done
            echo "|        $saved! = $factorial      "
            echo "|______________________________|"
            ;;                         
         
        *) # Any other operand will give this error msg
            echo "|   Enter the Right Operation  |"
            echo "| or Get a better CALCULATOR!! |"
            echo "|______________________________|"
            exit 1
            ;;

    esac
    exit 0
