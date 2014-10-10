#/bin/bash
# This script autho-configure the sssd.conf file
# it uses "host -t srv _ldap._tcp.domain.com" to detect the domain
# controller

DOMAIN=$(hostname -d)
Realm=$(hostname -d | tr '[:lower:]' ' [:upper:]')
Dcn=$(hostname -d|sed 's/.com//g')
ADserv=$(host -t srv _ldap._tcp.$(hostname -d)|awk '{ print $8 }'|sed 's/.se./.se/g')

echo $ADserv

# How many AD servers do we got?
	COUNT=$(host -t srv _kerberos._tcp.$(hostname -d)|awk '{ print $8 }'|sed 's/.com./.com/g'|grep [a-z]|wc -l)

	# Select a random number, based on how many AD servers we found
	r=$(( $RANDOM % $COUNT )); 

	# Add one, to avoid getting 0.
	#SELECT=$( echo $r+1|bc )
	SELECT=$( echo $r+1 )

	# Fetch the Nth AD server, where Nth is the random number we got above.
	ADSERVER=$(host -t srv _kerberos._tcp.$(hostname -d)|awk '{ print $8 }'|sed 's/.com./.com/g'|grep [a-z]|awk '{ if(NR==n) print $0 }' n=$SELECT)
	echo $ADSERVER


createsssdconf (){
cat <<'EOF'>sssd.conf
# SSSD will not start if you do not configure any domains.
# Add new domain configurations as [domain/<NAME>] sections, and
# then add the list of domains (in the order you want them to be
# queried) to the "domains" attribute below and uncomment it.
#
#
#
[sssd]
config_file_version = 2
services = nss, pam
debug level = 0
EOF

echo "domains = $DOMAIN">>sssd.conf
cat<<'EOF'>>sssd.conf
[nss]
filter_groups = root

[pam]
reconnection_retries = 3
# An example Active Directory domain. Please note that this configuration
# works for AD 2003R2 and AD 2008, because they use pretty much RFC2307bis
# compliant attribute names. To support UNIX clients with AD 2003 or older,
# you must install Microsoft Services For Unix and map LDAP attributes onto
# msSFU30* attribute names.
EOF

echo "[domain/$DOMAIN]" >>sssd.conf
cat<<'EOF'>>sssd.conf
id_provider = ldap
auth_provider = krb5
chpass_provider = krb5
access_provider = ldap

ldap_sasl_mech = GSSAPI
EOF
echo "ldap_sasl_authid = host/$HOSTNAME@$Realm" >> sssd.conf
echo "#ldap_uri = ldap://$ADserv" >> sssd.conf
 
cat<<'EOF'>>sssd.conf
ldap_schema = rfc2307bis
ldap_id_mapping = false   
ldap_user_object_class = user
ldap_user_home_directory = unixHomeDirectory
ldap_user_principal = userPrincipalName
ldap_user_name = sAMAccountName
EOF

echo "ldap_user_search_base = ou=users,dc=$Dcn,dc=com">>sssd.conf
cat<<'EOF'>>sssd.conf
ldap_group_object_class = group
ldap_access_order = expire
ldap_account_expire_policy = ad
EOF

echo "ldap_group_search_base = ou=groups,dc=$Dcn,dc=com" >>sssd.conf

cat<<'EOF'>>sssd.conf
cache_credentials = true
enumerate = false
ldap_enumeration_refresh_timeout = 86400
entry_cache_timeout = 86400
	
ldap_force_upper_case_realm = true
ldap_disable_referrals = true
EOF
echo "krb5_realm = $Realm" >> sssd.conf

}

createsssdconf
