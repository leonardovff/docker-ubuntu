FROM ubuntu:focal
LABEL autor="lvff <leonardovff@gmail.com>"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    rsyslog \
    php7.4-fpm \
    php-pgsql php-xml php-mbstring php-curl\
    php-zip php-gd php-intl php-xmlrpc \
    php-soap \
    libfcgi0ldbl \
    nano \
    net-tools
    # php-json php-pdo \
    # php-pear php-bcmath

EXPOSE 9000/tcp

# HEALTHCHECK --interval=10s --timeout=5s --retries=10 CMD curl --insecure https://127.0.0.1/ping || exit 1

CMD ["php-fpm7.4", "-F", "-R"]
