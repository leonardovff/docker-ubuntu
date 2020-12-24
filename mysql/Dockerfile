FROM ubuntu:focal
LABEL author="lvff <leonardovff@gmail.com>"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt -y install mysql-server \
    nano
# RUN  mkdir -p /var/lib/mysql && \
# 	mkdir -p /var/run/mysqld && \
# 	mkdir -p /var/log/mysql && \
# 	chown -R mysql:mysql /var/lib/mysql && \
# 	chown -R mysql:mysql /var/run/mysqld && \
# 	chown -R mysql:mysql /var/log/mysql

# UTF-8 AND BIND 0.0.0.0
RUN sed -i -e "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mysql.conf.d/mysqld.cnf
    #sed -i -e "s/\(\[client\]\)/\1\ndefault-character-set = utf8/g" /etc/mysql/mysql.conf.d/mysqld.cnf && \
	#sed -i -e "s/\(\[mysql\]\)/\1\ndefault-character-set = utf8/g" /etc/mysql/mysql.conf.d/mysqld.cnf && \
# RUN /etc/init.d/rsyslog start

COPY ./startup.sh /root/startup.sh
RUN chmod +x /root/startup.sh
RUN /root/startup.sh

VOLUME /var/lib/mysql

ENTRYPOINT /root/startup.sh
# HEALTHCHECK --interval=10s --timeout=5s --retries=10 CMD curl --insecure https://127.0.0.1/ping || exit 1
EXPOSE 3306
# USER mysql
CMD cp -ap /var/lib/mysql2 /var/lib/mysql && ls -la /var/lib/mysql && mysqld_safe