#!/bin/bash 
# Falade Olumuyiwa Lx13  Written 01/12/2014


OpTion=$1
ClI () {
#read -p "Enter your Search Directory! " InPut
    if [ ! -d $InPut ]; then
    echo "This is not a Directory!!"
    
else
    #cd $InPut
    echo -e "These are the list of Bash files in this Directory \n"
    ls *.sh  
fi
}

GuI () { 
if [ ! -d $InPut ]; then
    zenity --error --title="Warning" --text="This is not a Directory"
else 
    Choice=`ls *.sh | zenity --list --title "Select the files to
     recover" --column "Files" --separator=" "`
     bash $Choice

fi
rm /tmp/tenta &>/dev/null
}

case $OpTion in 
    [cC] )
        ClI ;;
    [gG] )
        GuI ;;
    *)
        echo "Du behöver valj C for CLI och G for GUI!!!"
esac
        

exit 0


