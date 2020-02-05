#!/bin/bash
sudo apt-get -y update
# Enable Ubuntu Firewall and allow TCP & MySQL Ports
sudo ufw enable
sudo ufw allow 80
sudo ufw allow 3306

# set up a silent install of MySQL
dbpass=Q!w2e3r4

export DEBIAN_FRONTEND=noninteractive
echo "mysql-server-5.6 mysql-server/root_password password" $dbpass | sudo debconf-set-selections
echo "mysql-server-5.6 mysql-server/root_password_again password" $dbpass | sudo debconf-set-selections
sudo apt-get -y install mysql-server-5.6

# install the LAMP stack
sudo apt-get -y install apache2 php5

# restart Apache
sudo service apache2 restart