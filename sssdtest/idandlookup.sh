identityAndLookup() {
       cat ./getent-group-lxadmin| >/dev/null 2>&1
       if [ $? -eq 0 ]; then
                echo "OK: Group lookup works. Was able to lookup group lxadmin."
                for theuser in $(cat ./getent-group-lxadmin|cut -d: -f4|sed 's/,/ /g'); do
                        if [ "$?" -eq 0 ]; then
                                echo "OK: Successfully looked up lxadmin user: $theuser"

                                if [[ $(cat ./getent-passwd-devsudo|grep $theuser |awk -F ":" '{print $3 }')  =~ ^[0-9]+$ ]]; then
                                        echo "OK: UID for user $theuser only contains digits."
                                        if [ $(cat ./getent-passwd-devsudo|grep $theuser |awk -F ":" '{print $3 }') != $(cat ./getent-passwd-devsudo|grep $theuser |awk -F ":" '{print $4 }') ]; then
                                                echo "Warning: User $theuser has an invalid UID or GID"
                                        else
                                                echo "OK: User $theuser has a valid UID and GID."
                                        fi
                                else
                                        echo "CRITICAL: UID for user $theuser contains something else than digits. Possible linuxts-alm bug."
                                        echo "CRITICAL: $theuser has an invalid UID or GID"
                                        echo "WARNING: $theuser might be a local user"

                                fi

                        else
                                echo "CRITICAL: Was not able to lookup lxadmin member $theuser"
                        fi
                done
       fi
}

identityAndLookup


