# Site Manager
Setup easy and fast nginx and php for a website

## Installation
The installer is going to setup latest stable versions of nginx and php
```bash
git clone https://github.com/ivandokov/site-manager.git
cd site-manager
./install-server
```

If you want to install xdebug you can run:
```bash
./install-xdebug
```

To make the `site-manager` globally accessible run:
```bash
sudo ln -s $(pwd)/site-manager /usr/local/bin/site-manager
```

## Usage

Creates system user, website root, logs and webroot directories, nginx and php-fpm configurations
```bash
site-manager create [domain.tld] [max-fpm-workers]
```

Deletes nginx and php-fpm configurations and optionally deletes the system user and website files
```bash
site-manager delete [domain.tld]
```

Enables nginx virtual host and php-fpm workers
```bash
site-manager enable [domain.tld]
```

Disables nginx virtual host and php-fpm workers
```bash
site-manager disable [domain.tld]
```