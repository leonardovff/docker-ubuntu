#!/bin/bash
cd $(dirname "$0")
cd ../apps/
mkdir mariadb
mkdir nextcloud
# curl -LO https://download.nextcloud.com/server/releases/nextcloud-20.0.4.zip
# unzip nextcloud-20.0.4.zip
# rm nextcloud-20.0.4.zip

cd ..
# up the containers
docker-compose up -d nextcloud-nginx

# settings permisions inside the container
docker-compose exec nextcloud-nginx chown -R www-data /usr/share/nginx/
docker-compose exec nextcloud-nginx chmod -R 770 /usr/share/nginx/
