FROM ubuntu:focal
LABEL author="lvff <leonardovff@gmail.com>"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt -y install nano net-tools

RUN apt -y install ca-certificates \
    gnupg2 \
	curl

RUN echo "deb http://apt.postgresql.org/pub/repos/apt focal-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
	curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \ 
	apt-get update && \ 
	apt-get -y install postgresql postgresql-contrib


# RUN  mkdir -p /var/lib/mysql && \
	# mkdir -p /var/run/mysqld && \
	# mkdir -p /var/log/mysql && \
	# chown -R mysql:mysql /var/lib/mysql && \
	# chown -R mysql:mysql /var/run/mysqld && \
	# chown -R mysql:mysql /var/log/mysql

# UTF-8 AND BIND 0.0.0.0
# RUN sed -i -e "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mysql.conf.d/mysqld.cnf
    #sed -i -e "s/\(\[client\]\)/\1\ndefault-character-set = utf8/g" /etc/mysql/mysql.conf.d/mysqld.cnf && \
	#sed -i -e "s/\(\[mysql\]\)/\1\ndefault-character-set = utf8/g" /etc/mysql/mysql.conf.d/mysqld.cnf && \
# RUN /etc/init.d/rsyslog start

# COPY ./startup.sh /root/startup.sh
# RUN chmod +x /root/startup.sh
# RUN /root/startup.sh

# VOLUME ["/var/lib/mysql"]


USER postgres

RUN    /etc/init.d/postgresql start &&\
    psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
    createdb -O docker docker &&\
	psql --command "CREATE Database moodle;"

# Adjust PostgreSQL configuration so that remote connections to the
# database are possible.
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/13/main/pg_hba.conf

# And add ``listen_addresses`` to ``/etc/postgresql/13/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> /etc/postgresql/13/main/postgresql.conf

# HEALTHCHECK --interval=10s --timeout=5s --retries=10 CMD curl --insecure https://127.0.0.1/ping || exit 1
EXPOSE 5432

# USER mysql
CMD ["/usr/lib/postgresql/13/bin/postgres", "-D", "/var/lib/postgresql/13/main", "-c", "config_file=/etc/postgresql/13/main/postgresql.conf"]