#!/bin/bash
 
# Generate a boot.properties file in the current directory.
  
# Place file in $DOMAIN_HOME/servers/AdminServer/security
   
. ~/set_oracle_env.sh

echo "Enter Username: "
read username
echo "Enter Password: "
read password

printf "username=" > ./boot.properties
java -Dweblogic.RootDirectory=$DOMAIN_HOME weblogic.security.Encrypt $username >> ./boot.properties
printf "password=" >> ./boot.properties
java -Dweblogic.RootDirectory=$DOMAIN_HOME weblogic.security.Encrypt $password >> ./boot.properties
