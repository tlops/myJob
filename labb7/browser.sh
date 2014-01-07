#!/bin/bash
# This Scripts helps user to select a browser to use!
#
# Falade Olumuyiwa LX13
# Labboration 7 uppgift 1
dialog --menu "Choose your Browser" 10 60 3 1 "firefox" 2 "chrome" 3 "Internet explorer" 2>/tmp/browser
Browse=`cat /tmp/browser` # stores the option in Browse
case $Browse in 
    1) firefox ;;
    2) chrome ;;
    3) internet explorer ;;
esac
if [ $? -ne 0 ]; then # if there is an error message because the browser is not installed
    dialog --title "Warning" --msgbox "The Browser You are trying is not installed!" 10 60
fi
rm /tmp/browser # deletes the file
exit 0

