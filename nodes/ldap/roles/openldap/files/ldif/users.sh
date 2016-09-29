#!/bin/bash


domain=$1
download_path=$2


users="
shauno|password|"ShaunO"
mikeb|password|"MikeB"
janef|password|"JaneF"
"
for each in $users; do
	user=`echo $each | cut -d\| -f1`
	pass=`echo $each | cut -d\| -f2`
	name=`echo $each | cut -d\| -f3`

hash=`/usr/sbin/slappasswd -h {SSHA} -s ${pass}`


cat <<EOF>> ${download_path}/users.ldif

dn: uid=${user},ou=people,${domain}
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: ${user}
sn: ${user}
givenName: ${name}
cn: ${user} 
displayName: ${user} 
uidNumber: 10000
gidNumber: 5000
userPassword: ${hash}
gecos: ${user} 
loginShell: /bin/bash
homeDirectory: /home/${user}

EOF

done

