### To run the cotainer with webserver

```bash
cd nginx
docker container build -t leonardovff/nginx .
docker container run -d -p 8080:80 -v $(pwd)/conf.d/:/etc/nginx/conf.d/ leonardovff/nginx
```u