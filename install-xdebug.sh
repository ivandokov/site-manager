#!/usr/bin/env bash

function msg {
    echo "========================================"
    echo "$1"
    echo "========================================"
}

# Install xdebug
msg "Installing xdebug"
sudo apt-get install -y php7.1-xdebug

# Setup xdebug
msg "Setting up xdebug"
echo "xdebug.remote_enable = 1" | sudo tee -a /etc/php/7.1/mods-available/xdebug.ini
echo "xdebug.remote_connect_back = 1" | sudo tee -a /etc/php/7.1/mods-available/xdebug.ini
echo "xdebug.remote_port = 9000" | sudo tee -a /etc/php/7.1/mods-available/xdebug.ini
echo "xdebug.max_nesting_level = 512" | sudo tee -a /etc/php/7.1/mods-available/xdebug.ini
echo "opcache.revalidate_freq = 0" | sudo tee -a /etc/php/7.1/mods-available/opcache.ini

# Disable xdebug for cli
#sudo phpdismod -s cli xdebug

# Restart php
msg "Restarting php-fpm"
sudo service php7.1-fpm restart
