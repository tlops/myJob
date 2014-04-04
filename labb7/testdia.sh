#!/bin/bash
dialog --backtitle "A dialogue Demo" --title "Just Testing" --msgbox "It can be used to inform users what the script does" 10 60 --yesno "Are you Sure?" 10 60 --infobox "Packar upp maps.gz till /tmp" 10 60 --pause "Vantar på Apache2!" 10 60 5

dialog --title "Text Editors" --checklist "Choose you favorite Text Editor!" 10 60 3 vi "Text Editorn Vi" off emacs "Text Editorn Emacs" off nano "Text editorn Nano" off

dialog --inputbox "Ditt Namn" 10 60 2>/tmp/namn
Namn=`cat /tmp/namn`
dialog --title "Name bar" --msgbox "Hej $Namn" 10 60
exit 0
