#! /bin/bash
sudo apt-get update
sudo apt-get install -y mariadb-server
sudo systemctl start mariadb.service

sudo mv /tmp/50-server.cnf /etc/mysql/mariadb.conf.d/

sudo systemctl restart mysql
sudo systemctl restart mysqld


exit 0