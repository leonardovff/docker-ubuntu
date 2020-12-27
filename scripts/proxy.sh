#!/bin/bash
cd $(dirname "$0")

cd ../apps/
mkdir letsencrypt

# up the containers
cd ..
docker-compose config

# create the project
docker-compose run proxy certbot --nginx 

# clean containers used
docker-compose rm -f proxy

# strapi the main service
docker-compose up -d proxy