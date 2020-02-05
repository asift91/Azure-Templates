#!/bin/bash
sudo apt-get -y update

# set up a silent install of MySQL
dbpass=$1

export DEBIAN_FRONTEND=noninteractive
echo "mysql-server-5.7 mysql-server/root_password password" $dbpass | sudo debconf-set-selections
echo "mysql-server-5.7 mysql-server/root_password_again password" $dbpass | sudo debconf-set-selections
sudo apt-get -y install mysql-server-5.7

# install the LAMP stack
sudo apt-get -y install apache2 php7

# restart Apache
sudo service apache2 restart


