-- connect to mysql using psql and run
CREATE USER moodle WITH PASSWORD '123321';
CREATE DATABASE "moodle" WITH OWNER "moodle" ENCODING 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';
GRANT ALL PRIVILEGES ON DATABASE "moodle" to moodle;
