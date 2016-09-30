#!/bin/bash

domain=$1 
download_path=$2

cat <<EOF>> ${download_path}/ou.ldif
dn: ou=People,${domain}
objectClass: organizationalUnit
ou: People

dn: ou=Groups,${domain}
objectClass: organizationalUnit
ou: Groups

dn: cn=services,ou=Groups,${domain}
objectClass: posixGroup
cn: services
gidNumber: 5000

EOF


