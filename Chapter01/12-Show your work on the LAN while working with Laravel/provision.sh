#!/usr/bin/env bash

# we want EPEL
sudo yum install -q -y epel-release
# install php-fpm
sudo yum install -q -y php-fpm
# PHP FPM runs as vagrant user
sudo sed -i 's/user = apache/user = vagrant/' /etc/php-fpm.d/www.conf
# Install composer, laravel, php default dependencies
sudo yum install -q -y php-pdo php-mcrypt php-mysql php-cli php-mbstring php-dom
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer
# install nginx
sudo yum install -q -y nginx
sudo cp /vagrant/nginx.conf /etc/nginx/nginx.conf
# install mariadb server
sudo yum install -q -y mariadb-server
# enable/start nginx/fpm/mariadb
sudo systemctl enable php-fpm
sudo systemctl start php-fpm
sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl enable mariadb
sudo systemctl start mariadb
# cd /srv/app; rm -rf ./*; composer create-project --prefer-dist laravel/laravel .
