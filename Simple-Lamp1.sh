#!/bin/bash
sudo apt-get -y update
# Enable Ubuntu Firewall and allow TCP & MySQL Ports
sudo ufw enable
sudo ufw allow 80
sudo ufw allow 3306

# set up a silent install of MySQL
dbpass=Q!w2e3r4

export DEBIAN_FRONTEND=noninteractive
echo mysql-server-5.6 mysql-server/root_password password $dbpass | debconf-set-selections
echo mysql-server-5.6 mysql-server/root_password_again password $dbpass | debconf-set-selections

# install the LAMP stack
apt-get -y install apache2 mysql-server php5 php5-mysql

# restart Apache
sudo service apache2 restart