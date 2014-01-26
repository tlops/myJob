#!/bin/bash 
# Falade Olumuyiwa Lx13  Written 01/15/2014
#
# This Script lets You manage user Account. Creat new account, delete account
# Lock and Unluck, Change shell, change password using a graphical interface.
# Zenity was Used to give the graphical interface.

if [ $EUID -ne 0 ]; then
    zenity --error --title="Sudo Warning" \
        --text="Contact your ADMINISTRATOR to run this Program!"
else
    Option=`zenity --list --title="FrontEnd Management" --column="" --hide-header \
        AddUser DelUser LockUser UnlockUser ChangePassword ChangeShell`

    Userlist=`cat /etc/passwd | tail -15 | awk -F ":" '{print $1}'>/tmp/usermgmt 2>/dev/null`
    #declare -a UserToLock=(`cat /tmp/usermgmt`)
    declare -a CopyUserList=(`cat /tmp/usermgmt`)

#### Adding User Function ####   
    AddUSER () { 
    Name=`zenity --entry --title="Add User" --text="Enter Name"`
    Group=`zenity --entry --title="Primary Group" --entry-text="Primary Group"`
    Username=`zenity --entry --title="User name" --text="Username for the New user"`
    Password=`zenity --entry --title="Password" --text="Enter Password" \
        --hide-text="Enter Password"`
        sudo useradd $Username -c "$Name" -g $Group -p $Password
    if [ $? -ne 0 ]; then 
        zenity --error --text="$Name was not added"
    else
        zenity --info --title="User Added" --text="An account with the name: $Name was created\
            and added to the group: $Group"
    fi
    }

######  Delete use function ####
    DeleteUSER () {
        UserToDel=`cat /tmp/usermgmt | zenity --list --title "Select User to delete" --column "Users" --separator=" "`
    for i in ${!CopyUserList[@]}; do
        if [ ${CopyUserList[$i]} = "$UserToDel" ]; then 
           sudo userdel -r ${CopyUserList[$i]} &>/dev/null
           if [ $? -ne 0 ]; then
               zenity --error --title="Not Deleted" --text="The User $UserToDel was not removed!"
           else
               zenity --info --title="Delete Successful" --text="The User Account: $UserToDel was \
                   Successfully REMOVED"
           fi
       fi
        ((i++))
    done
 
    }

    ######### Lock User Function ####
    LockUSER () {
        UserToLock=`cat /tmp/usermgmt | zenity --list --title "Select User to Lock" --column "Users" --separator=" "`
    for i in ${!CopyUserList[@]}; do
        if [ ${CopyUserList[$i]} = "$UserToLock" ]; then 
           sudo usermod -L ${CopyUserList[$i]} &>/dev/null
           if [ $? -ne 0 ]; then
               zenity --error --title="Not Locked" --text="The User $UserToLock was not Locked!"
           else
               zenity --info --title="Lock Successful" --text="The User Account: $UserToLock was\
                   Successfully LOCKED!!!"
           fi
       fi
        ((i++))
    done
     
    }

############# UNLOCK user ############
    UnLockUSER () {
        UserUnLock=`cat /tmp/usermgmt | zenity --list --title "Select User to Lock" --column "Users" --separator=" "`
    for i in ${!CopyUserList[@]}; do
        if [ ${CopyUserList[$i]} = "$UserUnLock" ]; then 
           sudo usermod -U ${CopyUserList[$i]} &>/dev/null
           if [ $? -ne 0 ]; then
               zenity --error --title="Not UnLocked" --text="The User $UserUnLock was not Unlocked!"
           else
               zenity --info --title="Lock Successful" --text="The User Account: $UserUnLock was\
                   Successfully UNLOCKED!!!"
           fi
       fi
        ((i++))
    done
     
    } 

########### Change Password Function ########3
    ChangePasswdUSER () {
        PasswdUser=`cat /tmp/usermgmt | zenity --list --title "Select User to Lock" --column "Users" --separator=" "`
        Passwd1=`zenity --entry --title="PASSWORD" --text="Enter New Password!" --hide-text`
        Passwd2=`zenity --entry --title="PASSWORD" --text="Confirm Password!" --hide-text`
        if [ $Passwd1 != $Passwd2 ]; then
            zenity --error --title="PASSWORD Error" --text="Your Passwords do not Match!"
        else
    for i in ${!CopyUserList[@]}; do
        if [ ${CopyUserList[$i]} = "$PasswdUser" ]; then
           sudo echo ${CopyUserList[$i]}: $Passwd2 | chpasswd &>/dev/null
           if [ $? -ne 0 ]; then
               zenity --error --title="PASSWORD Error" --text="The Password for user: $PasswdUser was not Changed!"
           else
               zenity --info --title="PASSWORD Successful" --text="The Password for User Account: $PasswdUser was\
                   Successfully changed!!!"
           fi
       fi
        ((i++))
    done
        fi
    } 

########## Change Shell Function #######
    ChangeSHELL () {
        User=`cat /tmp/usermgmt | zenity --list --title "Select User to Change Shell" --column "Users" --separator=" "`
        SHell=`cat /etc/shells | zenity --list --title "Select New Shell!" --column "Shells" --separator=" "`
    for i in ${!CopyUserList[@]}; do
        if [ ${CopyUserList[$i]} = "$User" ]; then 
           sudo usermod -s $SHell ${CopyUserList[$i]} &>/dev/null
           if [ $? -ne 0 ]; then
               zenity --error --title="Shell Not Changed" --text="The User $User's shell was not Changed!"
           else
               zenity --info --title="Change Successful" --text="The Shell for User: $User was\
                   Successfully Changed to $SHell!!!"
           fi
       fi
        ((i++))
    done
     
    }

#### Bringing It All Together #######
    case $Option in
        AddUser) AddUSER ;;
        DelUser) DeleteUSER ;;
        LockUser) LockUSER ;;
        UnlockUser) UnLockUSER ;;
        ChangeShell) ChangeSHELL ;;
        ChangePassword) ChangePasswdUSER ;;
    *) zenity --info --text="No Option taken" &&  exit 5;;
    esac

    rm /tmp/usermgmt 
fi
