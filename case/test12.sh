#!/bin/bash 
# Falade Olumuyiwa Lx13  Written 02/09/20140



        FirstName=`zenity --entry --title="Create New Account" --text="Enter First Name"`
        LastName=`zenity --entry --title="Create New Account" --text="Enter Last Name"`
        PersonNr=`zenity --entry --title="Create New Account" --entry-text="Enter Personnummer"`
        Passcode1=`zenity --entry --title="Create New Account" --text="Enter Passcode"\
                    --hide-text="Enter Passcode"`
        Passcode2=`zenity --entry --title="Create New Account" --text="Confirm Passcode" \
                    --hide-text="Enter Passcode"`
            if [ $Passcode1 != $Passcode2 ]; then
                zenity --error --title="Non Matching Code" --text="Your passcode do not match!!"
                exit 1
            fi
        InitialDeposit=`zenity --entry --title="Create New Account" --text="Enter Your Initial Deposit"`
        #   Regular Expression
        re='^[0-9]+([.][0-9]+)?$'                # This two lines checks to make sure you
            if ! [[ $InitialDeposit =~ $re ]] ; then # Enter valid floating number and not string
                 zenity --error --text="Enter Digits for Currency"
            fi
         echo "INSERT INTO Customer (FirstName, LastName, PersonNummer, Passcode, Deposit) \
             VALUES ('$FirstName', '$LastName', '$PersonNr', '$Passcode2', '$InitialDeposit');" | mysql -uroot -pmuyiwa82 Bank;
       # echo -e "$PersonNr \t $FirstName \t $LastName\t $Passcode2 \t $InitialDeposit">>/tmp/Account 2>/dev/null
            if [ $? -ne 0 ]; then
               zenity --info --text="Your Account was not created!!!"
            else
               zenity --info --text="An Account has been created for $FirstName, Remember your \
                 Personnumber and Passcode to access your Account. Welcome to our Bank!!!"
            fi
 
 
