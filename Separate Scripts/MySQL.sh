#!/bin/bash
sudo apt-get -y update

# set up a silent install of MySQL
dbpass=Q!w2e3r4

export DEBIAN_FRONTEND=noninteractive
echo "mysql-server-5.7 mysql-server/root_password password" $dbpass | sudo debconf-set-selections
echo "mysql-server-5.7 mysql-server/root_password_again password" $dbpass | sudo debconf-set-selections
sudo apt-get -y install mysql-server-5.7