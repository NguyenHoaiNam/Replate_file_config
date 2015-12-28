echo "Nhap IP mysql:"
read IP
mysql -uroot -pabc123 -h$IP -e "DROP DATABASE neutron;"
mysql -uroot -pabc123 -h$IP -e "DROP DATABASE keystone;"
mysql -uroot -pabc123 -h$IP -e "DROP DATABASE glance;"
mysql -uroot -pabc123 -h$IP -e "DROP DATABASE nova;"
mysql -uroot -pabc123 -h$IP -e "DROP DATABASE nova_api;"

echo "Finished drop BD, next step is install MariaBD"
sudo apt-get purge -y mysql*
sudo apt-get install python-software-properties -y
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
sudo add-apt-repository 'deb http://ftp.osuosl.org/pub/mariadb/repo/5.5/ubuntu trusty main'
sudo apt-get update
sudo apt-get install mariadb-galera-server galera

sudo sed -i 's/bind-address/#bind-address/g' /etc/mysql/my.cnf

echo "Next steps: Configure Cluster_MariaBD"
