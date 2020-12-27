#!/bin/bash
cd $(dirname "$0")
cd ../apps/
mkdir mysql
curl -LO https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
rm latest.tar.gz

cd ..
# up the containers
docker-compose config
docker-compose up -d wordpress-nginx

sleep 20
# # new database
docker-compose exec wordpress-db mysql --user=root --password=123321 -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

# # new user
docker-compose exec wordpress-db mysql --user=root --password=123321 -e "CREATE USER 'wordpress'@'%' IDENTIFIED WITH mysql_native_password BY '123321';"

# # GRANT PERMISSIONS
docker-compose exec wordpress-db mysql --user=root --password=123321 -e "GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES,DROP,INDEX,ALTER ON wordpress.* TO wordpress@'%'; FLUSH PRIVILEGES;"

# settings permisions inside the container
docker-compose exec wordpress-nginx chown -R www-data /usr/share/nginx/
docker-compose exec wordpress-nginx chmod -R 770 /usr/share/nginx/
