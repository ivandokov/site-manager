#!/usr/bin/env bash

function msg {
    echo "========================================"
    echo "$1"
    echo "========================================"
}

# Add ppa
msg "Adding ppa for nginx and php"
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:nginx/stable -y
LC_ALL=C.UTF-8 sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update

# Install nginx and php
msg "Installing nginx"
sudo apt-get install -y nginx

msg "Installing php"
sudo apt-get install -y php7.1-fpm php7.1-cli \
php7.1-mysql php7.1-pgsql php7.1-sqlite3 \
php7.1-curl php7.1-memcached php7.1-redis \
php7.1-imap php7.1-mbstring php7.1-gd \
php7.1-xml php7.1-zip php7.1-soap \
php7.1-intl php7.1-readline php7.1-json php7.1-opcache

# Setup nginx
msg "Setting up nginx"
sudo rm /etc/nginx/sites-enabled/default
sudo rm /etc/nginx/sites-available/default
echo 'fastcgi_param HTTP_PROXY "";' | sudo tee -a /etc/nginx/fastcgi.conf
echo 'fastcgi_param HTTP_PROXY "";' | sudo tee -a /etc/nginx/fastcgi_params
echo 'proxy_set_header Proxy "";' | sudo tee -a /etc/nginx/proxy_params

# Setup php
msg "Setting up php"
sudo sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.1/cli/php.ini
sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.1/cli/php.ini
sudo sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.1/cli/php.ini
sudo sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/7.1/cli/php.ini
sudo sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.1/fpm/php.ini
sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.1/fpm/php.ini
sudo sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.1/fpm/php.ini
sudo sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.1/fpm/php.ini
sudo sed -i "s/upload_max_filesize = .*/upload_max_filesize = 100M/" /etc/php/7.1/fpm/php.ini
sudo sed -i "s/post_max_size = .*/post_max_size = 100M/" /etc/php/7.1/fpm/php.ini
sudo sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/7.1/fpm/php.ini

# Install composer
msg "Installing composer"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Restart services
msg "Restarting nginx and php-fpm"
sudo service nginx restart
sudo service php7.1-fpm restart
