#!/bin/bash
cd $(dirname "$0")

cd ../apps/
mkdir letsencrypt

# up the containers
cd ..
docker-compose config

# strapi the main service
docker-compose up -d proxy

# certbot
docker-compose exec proxy certbot --nginx 