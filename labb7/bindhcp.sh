#!/bin/bash
#
####### Paulena's Script
#
tmp=$(mktemp /tmp/dhcp.XXX)
conf="$HOME/dhcp.conf"

settings(){
        dialog --backtitle "DHCP.conf" \
        --title "$1 settings" \
        --inputbox "Enter your $1 settings:" 15 60 2> $tmp
        setting=$(<$tmp)
               
        case $1 in
        'subnet')       subnet=$setting ;;
        'netmask')      netmask=$setting ;;
        'range_start')  range_start=$setting ;;
        'range_end')    range_end=$setting ;;
        'DNS')          DNS=$setting ;;
        'routers')      routers=$setting ;;
        'default_lease_time')      default_lease_time=$setting ;;
        'max_lease_time')          max_lease_time=$setting ;;
         esac
rm $tmp
}

for i in subnet netmask range_{start,end} DNS routers default_lease_time max lease_time; do
    settings $i;
    done
        cat <<EOF> $conf
        subnet $subnet netmask $netmask{
        range $range_start $range_end;
        option domain-name-servers $DNS;
        option routers $routers;
        ddns-update-style none;
        default-lease-time $default_lease_time;
        max-lease-time $max_lease_time;
        }
        EOF

dialog --textbox $conf 15 60
exit 0
