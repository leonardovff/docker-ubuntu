#!/bin/bash
cd $(dirname "$0")
cd ../apps/

git clone git://git.moodle.org/moodle.git
cd moodle
git branch -a            
git branch --track MOODLE_310_STABLE origin/MOODLE_310_STABLE       
git checkout MOODLE_310_STABLE  

# cd ..
mkdir postgres
cd ..
# up container
docker-compose up -d moodle-nginx
docker-compose exec moodle-db psql -U postgres -c "CREATE USER moodle WITH PASSWORD '123321'";
docker-compose exec moodle-db psql -U postgres -c "CREATE DATABASE \"moodledb\" WITH OWNER \"moodle\" ENCODING 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8'";
docker-compose exec moodle-db psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE \"moodledb\" to moodle";
