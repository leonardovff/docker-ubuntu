FROM ubuntu:focal
LABEL autor="lvff <leonardovff@gmail.com>"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    php7.4-fpm \
    php7.4-pgsql php7.4-mysql php7.4-pdo\
    php7.4-imagick php7.4-mbstring php7.4-curl\
    php7.4-zip php7.4-gd php7.4-intl php7.4-xmlrpc \
    php7.4-json php7.4-xml php7.4-soap \
    libfcgi0ldbl 

## for debug
RUN apt-get install -y \
    nano \
    net-tools
    # php-pear php-bcmath

EXPOSE 9000/tcp

# HEALTHCHECK --interval=10s --timeout=5s --retries=10 CMD curl --insecure https://127.0.0.1/ping || exit 1

CMD ["php-fpm7.4", "-F", "-R"]
