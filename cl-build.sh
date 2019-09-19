#!/bin/bash

# set permissions: owner (roland) can write, group (hiawatha) can read or enter dir
sudo chown roland:hiawatha /home/roland/sync-stage/thegiftnetwork -R
find /home/roland/sync-stage/thegiftnetwork -type d -exec chmod 750 {} +
find /home/roland/sync-stage/thegiftnetwork -type f -exec chmod 640 {} +

# renew angular files
rsync -a /home/roland/sync-stage/thegiftnetwork/* /var/www/thegiftnetwork.org/www/public --delete

# copy over index html files to twig template that generates the eventual angular index page
cp /var/www/thegiftnetwork.org/www/public/index.html /var/www/thegiftnetwork.org/www/templates/angular.html.twig -rf
