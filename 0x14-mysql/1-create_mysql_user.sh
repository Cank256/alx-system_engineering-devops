#!/usr/bin/env bash
# Create MySQL user named holberton_user on web-01 and web-02

# MySQL user credentials
MYSQL_USER="holberton_user"
MYSQL_PASSWORD="projectcorrection280hbtn"

# Create user and grant permissions
mysql -e "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';
           GRANT REPLICATION CLIENT ON *.* TO '${MYSQL_USER}'@'localhost';"
