#!/bin/bash
# simple bashscript to create a mysql/mariadb database with a corresponding user

echo "Enter SHORTNAME without any prefix."
echo "Proposed db_name will be db_\${SHORTNAME}"
echo "Proposed username will be u_\${SHORTNAME}"
echo "_______________________________________"
echo ""
echo ""
read -p    "SHORTNAME:      " SHORTNAME

read -e -p "db name:        " -i "db_${SHORTNAME}" DB_NAME
read -e -p "db username:    " -i "u_${SHORTNAME}" DB_USERNAME
read -e -p "db host:        " -i "localhost" DB_HOST
read -e -p "Password:       " -i "$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;)" PW

echo "_______________________________________"
echo ""
echo "CREATE DATABASE ${DB_NAME};"
echo "CREATE USER '${DB_USERNAME}'@'${DB_HOST}' IDENTIFIED BY '${PW}';"
echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USERNAME}'@'localhost'"

