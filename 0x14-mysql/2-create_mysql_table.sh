#!/usr/bin/env bash
# Create MySQL database, table, and entry on web-01

# MySQL credentials
MYSQL_USER="holberton_user"
MYSQL_PASSWORD="projectcorrection280hbtn"

# Create database, table, and entry
mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS tyrell_corp;
                                              USE tyrell_corp;
                                              CREATE TABLE IF NOT EXISTS nexus6 (
                                                  id INT AUTO_INCREMENT PRIMARY KEY,
                                                  name VARCHAR(255) NOT NULL
                                              );
                                              INSERT INTO nexus6 (name) VALUES ('Leon');"
