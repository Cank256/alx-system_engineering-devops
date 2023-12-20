#!/usr/bin/env bash
# Create replica_user on web-01 for MySQL replication

# MySQL credentials
MYSQL_USER="holberton_user"
MYSQL_PASSWORD="projectcorrection280hbtn"

# Create replica user and grant permissions
mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD} -e "CREATE USER 'replica_user'@'%' IDENTIFIED BY 'your_password_here';
                                               GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';"
