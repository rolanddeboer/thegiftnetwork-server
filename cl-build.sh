#!/bin/bash

# renew angular files
rsync -a /home/roland/sync-stage/thegiftnetwork/* /var/www/thegiftnetwork.org/www/public --delete

# set permissions: owner (roland) can write, group (hiawatha) can read or enter dir
sudo chown roland:hiawatha /var/www/thegiftnetwork.org/www/public -R
find /var/www/thegiftnetwork.org/www/public -type d -exec chmod 750 {} +
find /var/www/thegiftnetwork.org/www/public -type f -exec chmod 640 {} +

# copy over index html files to twig template that generates the eventual angular index page
mv /var/www/thegiftnetwork.org/www/public/index.html /var/www/thegiftnetwork.org/www/templates/angular.html.twig -rf
