#!/bin/bash

echo "Scrip will setup Cluster Database for your system"

sudo apt-get purge mysql* -y
# Install MariaDB

apt-get install python-software-properties -y
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
sudo add-apt-repository 'deb http://ftp.osuosl.org/pub/mariadb/repo/5.5/ubuntu trusty main'
sudo apt-get update
sudo apt-get install mariadb-galera-server galera

sudo sed -i 's/bind-address/#bind-address/g' /etc/mysql/my.cnf

echo "Next steps: Configure Cluster_MariaBD"
