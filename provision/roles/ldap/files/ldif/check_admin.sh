#!/bin/bash

user_dn=$1
password=$2

ldapwhoami -D $user_dn -w $password > /dev/null 2>&1
echo $?

