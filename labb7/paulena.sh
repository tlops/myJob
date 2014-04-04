#!/bin/bash
#
##### Paulena's Script
#
tmp=$(mktemp /tmp/menu.XXX)
browserchk(){
  command -v $1 &> /dev/null
  if [ $? -ne 0 ]; then
       dialog --title "web browser" \
      --msgbox "It seems that you don't have ${1^} installed." 10 30
       exit 1
  else
       ${1} &> /dev/null
  fi
 }                                           

dialog --title "Web browser" \
       --menu "Please choose a web browser:" 15 30 3 \
       1 Firefox \
       2 Chrome \
       3 IceWeasel \
       2> $tmp
selected=$(<$tmp)
    case $selected in
        1) browserchk firefox        ;;
        2) browserchk chrome        ;;
        3) browserchk iceweasel        ;;
    esac
rm $tmp
exit 0
