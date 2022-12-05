#! /bin/bash
sudo apt-get update
sudo apt-get install -y nginx

## Install PHP and PHP MYSQL PDO plugin
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get install -y php8.2-fpm
sudo apt-get install -y php8.2-mysql
sudo phpenmod pdo_mysql


sudo mv /tmp/default /etc/nginx/sites-available/
sudo mv /tmp/bulgaria-map.png /var/www/html/
sudo mv /tmp/config.php /var/www/html/
sudo mv /tmp/index.php /var/www/html/

sudo systemctl restart php8.2-fpm
sudo systemctl restart nginx

exit 0