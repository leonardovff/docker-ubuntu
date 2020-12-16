FROM ubuntu:focal
LABEL autor="lvff <leonardovff@gmail.com>"

RUN apt-get update && \
    apt-get install -y \
    ca-certificates \
    gnupg2

## NGINX instalation
RUN echo "deb https://nginx.org/packages/ubuntu/ focal nginx\n" \
    "deb-src https://nginx.org/packages/ubuntu/ focal nginx" \
    > /etc/apt/sources.list.d/nginx.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ABF5BD827BD9BF62
RUN apt-get update \
    && apt-get install -y nginx

EXPOSE 80/tcp

# HEALTHCHECK --interval=10s --timeout=5s --retries=10 CMD curl --insecure https://127.0.0.1/ping || exit 1

CMD ["nginx", "-g", "daemon off;"]