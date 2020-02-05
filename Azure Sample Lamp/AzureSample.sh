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

# write some PHP
echo \<center\>\<h1\>My Demo App\</h1\>\<br/\>\</center\> > /var/www/html/phpinfo.php
echo \<\?php phpinfo\(\)\; \?\> >> /var/www/html/phpinfo.php

# restart Apache
sudo service apache2 restart


