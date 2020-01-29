# Site Manager
Setup easy and fast nginx and php for a website

## Installation
The installer is going to setup latest stable version of **nginx** and ask you for the desired **php** version
```bash
git clone https://github.com/ivandokov/site-manager.git
cd site-manager
./install
```

**If you want to install more versions of php you can safely run the installer again.**

## Usage

Creates system user, website root, logs and webroot directories, nginx and php-fpm configurations
```bash
site-manager create [domain.tld] [min-fpm-workers: number] [max-fpm-workers: number] [display-errors: on|off]
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

Change the php version of the website
```bash
site-manager php [domain.tld]
```

## Configuration

If you want to change the default behavior you can create a configuration file at `/etc/site_manager` or `~/.site_manager`. The configuration from your home directory takes priority.

**Available configuration variables**
```bash
# Location where all sites will be created
SITES_DIR=/var/www

# Location of the web root
# Full website path is ${SITES_DIR}/${DOMAIN}/${PUBLIC_DIR}
PUBLIC_DIR=public

# Default max php-fpm workers used when not specified
FPM_MAX_WORKERS=5

# Default min php-fpm workers used
FPM_MIN_WORKERS=1

# Control error displaying: on|off
FPM_DISPLAY_ERRORS=on

# Logs location
LOGS_DIR=/var/log/www
``` 