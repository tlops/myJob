#!/bin/bash
# This script tests how failover in "ldap_uri://" sssd
# works. It severes the connection to the current AD 
# server by using  (iptable rules) then waita to see if
# a new connection will be established with an alternate
# AD server.

if [ $EUID -ne 0 ]; then
   echo "You need to be root to run this!"
   exit
fi

ADConserver=$(authconfig --enablesssd --probe|awk '{print $2}'| sed 's/\/DC=,DC=falade-ot,DC=se//g')
#/sbin/iptables -I INPUT -s $ADConserver -j DROP &>testing-error.log
 ping -c 1 -w 1 $ADConserver &>testing-error.log

if [ $? -eq 0 ]; then
   echo "disconnecting from current AD server " $ADConserver
   sudo service sssd restart &>>testing-error.log
   sleep 2 # wait for sssd to reconfigure
   getent passwd $USER &>>testing-error.log
   
   if [ $? -ne 0 ]; then
      echo -e "\nNot getting user info: Check testing-error.log for details!"
   else
      ADNewserver=$(authconfig --enablesssd --probe|awk '{print $2}'| sed 's/\/DC=,DC=falade-ot,DC=se//g')
      echo "This is the new server: "$ADNewserver
   fi
else
   echo "Somethin went wrong with the iptable rules: "
fi
 
