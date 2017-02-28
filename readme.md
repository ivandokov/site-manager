# Site
Setup easy and fast nginx and php for a website

## Installation
The installer is going to setup latest stable versions of nginx and php
```bash
git clone https://github.com/ivandokov/site.git
cd site
./install-server
```

If you want to install xdebug you can run:
```bash
./install-xdebug
```

To make the `site` file globally accessible run:
```bash
sudo ln -s $(pwd)/site /usr/local/bin/site
```

## Usage

Creates system user, website root, logs and webroot directories, nginx and php-fpm configurations
```bash
site create domain.tld
```

Deletes nginx and php-fpm configurations and optionally deletes the system user and website files
```bash
site delete domain.tld
```

Enables nginx virtual host and php-fpm workers
```bash
site enable domain.tld
```

Disables nginx virtual host and php-fpm workers
```bash
site disable domain.tld
```