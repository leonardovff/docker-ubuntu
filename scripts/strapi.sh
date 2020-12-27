#!/bin/bash
cd $(dirname "$0")

cd ../apps/
mkdir strapi

# up the containers
cd ..
docker-compose config
docker-compose up -d strapi-db

# create the project
docker-compose run -p 1337:1337 strapi-node npx create-strapi-app my-project 

# put in correct folder
docker-compose run strapi-node cp -a ./my-project/. /usr/src/app
docker-compose run strapi-node rm -rf ./my-project/

# build front-end
docker-compose run strapi-node npm run build

# clean containers used
docker-compose rm -f strapi-node

# strapi the main service
docker-compose up -d strapi-node