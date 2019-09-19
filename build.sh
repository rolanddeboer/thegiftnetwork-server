#!/bin/bash

cd /var/www/thegiftnetwork/www

# renew symfony files
git pull origin master

# chmod g+rwxs var/cache

# set permissions for everything: owner (roland) can write, group (hiawatha) can read or enter dir
sudo chown roland:hiawatha . -R
find . -type d -exec chmod 750 {} +
find . -type f -exec chmod 640 {} +

# executables should stay executable
chmod 700 build.sh cl-build.sh composer-install.sh

# cache and log should be group (hiawatha) writable
find var/cache -type d -exec chmod 770 {} +
find var/cache -type f -exec chmod 660 {} +
find var/log -type d -exec chmod 770 {} +
find var/log -type f -exec chmod 660 {} +

# run server specific composer install script
./composer-install.sh
