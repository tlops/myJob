#!/bin/bash
# This code does basic Arithmetic
# Operations
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
         
        *) 
            echo "|   Enter the Right Operation  |"
            echo "| or Get a better CALCULATOR!! |"
            echo "|______________________________|"
            exit 1

    esac
    exit 0
