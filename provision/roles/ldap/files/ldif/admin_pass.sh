#!/bin/bash

domain=$1
password=$2
filepath=$3

ldapsearch -H ldapi:// -LLL -Q -Y EXTERNAL -b "cn=config" "(olcRootDN=*)" dn olcRootDN olcRootPW | tee ${filepath}newpasswd.ldif
/usr/sbin/slappasswd -h {SSHA} -s ${password} >> ${filepath}newpasswd.ldif
sed -i '/^olcRootDN: cn=admin.*/a changetype: modify\nreplace: olcRootPW' ${filepath}newpasswd.ldif
sed -i '/^olcRootDN: cn=admin.*/s/^/#/' ${filepath}newpasswd.ldif
sed -i '/^olcRootPW:.*/d' ${filepath}newpasswd.ldif
sed -i '/^\s*$/d' ${filepath}newpasswd.ldif
sed -i '/{SSHA}.*/s/^/olcRootPW: /'  ${filepath}newpasswd.ldif
ldapmodify -H ldapi:// -Y EXTERNAL -f  ${filepath}newpasswd.ldif
