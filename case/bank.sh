#!/bin/bash 
# Falade Olumuyiwa Lx13  Written 01/19/2014
#
# This scripts runs a pseudo Banking system where you can create
# An account, Change Passcode, make deposit and withdrawal. The
# challenge is that the current value is not saved but it prints
# on the screen.

NewAccount () {
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
    echo -e "$PersonNr \t $FirstName \t $LastName\t $Passcode2 \t $InitialDeposit">>/tmp/Account 2>/dev/null
    if [ $? -ne 0 ]; then
        zenity --info --text="Your Account was not created!!!"
    else
        zenity --info --text="An Account has been created for $FirstName, Remember your \
            Personnumber and Passcode to access your Account. Welcome to our Bank!!!"
    fi
        
}
        if [ ! -s /tmp/Account ]; then
            zenity --info --title="File Error" --text=" The File /tmp/Account: which is where the information \
            are stored does not exist or There is no active account stored in it. Create it by selecting \
            create Account menu. Thanks. MANAGEMENT."
        else
    #### Arrays
            declare -a Pass=(`cat /tmp/Account | awk '{print $4}'`) 2>/dev/null # Passcode
            declare -a User=(`cat /tmp/Account | awk '{print $1}'`) 2>/dev/null # Personnummer
            declare -a Balance=(`cat /tmp/Account | awk '{print $5}'`)  2>/dev/null # Money in acct
        fi
LoginAcct () {
    Loginuser=`zenity --entry --title="Login Account" --entry-text="Enter Personnummer"`
    Loginpasswd=`zenity --entry --title="Login Account" --text="Enter Your Passcode" \
                --hide-text="Enter Your Passcode"`
    for i in ${!User[@]}; do
        if [ ${User[$i]} -eq "$Loginuser" -a ${Pass[$i]} -eq "$Loginpasswd" ]; then
            LoginAction=`zenity --list --title="Welcome to ATM" --column "What would like \
                to do Today" Deposit Withdrawal CheckBalance ChangePassCode CloseAccount`
            case $LoginAction in
                Deposit) DepositAcct ;;
            Withdrawal) WithdrawalAcct ;;
                      *) zenity --info --text="Under Construction" ;;
            esac
        else
            zenity --error --title="Login Fail!" --text="Your Personnumer or your Passcode\
            is wrong"
        fi
    done
}

DepositAcct () {
    Amt=`zenity --entry --text="How much will you Deposit!"`   
    re='^[0-9]+([.][0-9]+)?$'
    if ! [[ $Amt =~ $re ]] ; then
        zenity --error --text="Enter Digits for Currency"
    else
        #Balance[$i]=`echo "${Balance[$i]}+$Amt" | bc` 
        New=`echo "${Balance[$i]}+$Amt" | bc` 
        zenity --info --text="Your previous Balance is ${Balance[$i]}SEK and Your \
            Current Balance is $New SEK! Thanks for Calling!"
    fi
exit 0
}

WithdrawalAcct () {
    Amt=`zenity --entry --text="How much will you Withdraw!"`   
    re='^[0-9]+([.][0-9]+)?$'
    if ! [[ $Amt =~ $re ]] ; then
        zenity --error --text="Enter Digits for Currency"
    else
        #Balance[$i]=`echo "${Balance[$i]}+$Amt" | bc` # This line works too
        New=`echo "${Balance[$i]}-$Amt" | bc`
        zenity --info --text="Your previous Balance is ${Balance[$i]}SEK and Your \
            Current Balance is $New SEK! Thanks for Calling!"
    fi
exit 0
}

    if [ $EUID -ne 0 ]; then
        zenity --error --title="Sudo Warning" \
        --text="Contact your ADMINISTRATOR to run this Program!"
    else
        Option=`zenity --list --title="ATM" --column="Select an Operation" \
            CreateAccount Login`

           case $Option in
               CreateAccoun) NewAccount ;;
                      Login) LoginAcct ;;
                        *) zenity --info --text="No option was selected" && exit 5
                    esac
    fi
exit 0
       
