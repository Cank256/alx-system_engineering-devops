#!/usr/bin/env bash
# Install MySQL on web-01 and web-02 servers

# Install MySQL
sudo apt-get update
sudo sed -i -e 's|focal|bionic|g' /etc/apt/sources.list
sudo apt-get -qq update
sudo apt-get install --no-install-recommends -y mysql-client-5.7

# Check MySQL version
mysql --version