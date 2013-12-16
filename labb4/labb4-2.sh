#!/bin/bash
# This code converts Swedish Kroner to Dollar and vice versa!
echo -n "Vill du konvertera från Kroner eller Dollar [K/D]:"
read Opt    # This stores the input

case $Opt in
       [kK]  ) # if the value of Opt is k or K, Do this!
         echo "You want to convert from Kroner! Enter your Amount in Kroner" 
         read Amt
         Pay=$(bc -l <<< "scale=3; $Amt/7")  # Coversion
         
         echo "You will get: $Pay Dollar!"
           ;;   # End of first option

       [dD] ) # if the value of Opt is d or D, Do this!
           echo "You want to convert from Dollar! Enter your Amount in Dollar!"
           read Amt     #stores the amount to be converted
           let Pay="$Amt*7" # Conversion to kroner
           echo "You will get: $Pay  Kroner!"
           ;; # End of second option

        * ) #if the Value is different from above k,K d,D, Do This!
            echo -e "\n Enter the write input [K/D]!"

   esac
   exit 0
