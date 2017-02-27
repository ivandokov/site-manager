# Site
Setup easy and fast nginx and php for a website

## Installation
The installer is going to setup latest stable versions of nginx and php
```bash
git clone https://github.com/ivandokov/site.git
cd site
./install-server.sh
```

If you want to install xdebug you can run:
```bash
./install-xdebug.sh
```

To make the `site.sh` file globally accessible run:
```bash
sudo ln -s $(pwd)/site.sh /usr/local/bin/site
```