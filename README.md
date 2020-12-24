### To run the cotainer with webserver

```bash
cd nginx
docker container build -t leonardovff/nginx .
docker container run -d -p 80:80 -v $(pwd)/nginx/conf.d/:/etc/nginx/conf.d/ -v $(pwd)/moodle:/usr/share/nginx leonardovff/nginx
```

### PHP-FPM
```bash
/etc/php/7.4/fpm/pool.d/

docker run -d -p 9000:9000 -v $(pwd)/php-fpm/pool.d/:/etc/php/7.4/fpm/pool.d/ -v $(pwd)/moodle:/usr/share/nginx -v $(pwd)/moodledata:/var/moodledata leonardovff/php-fpm
```

### MYSQL
```bash
docker run -it -p 3306:3306 -v $(pwd)/mysql/data/mysqld:/var/run/mysqld -v $(pwd)/mysql/data/mysql/var/log/mysql leonardovff/mysql bash
```

### POSTGRESQL
```bash
docker container build -t leonardovff/postgres .
docker run -d -p 5432:5432 leonardovff/postgres
```