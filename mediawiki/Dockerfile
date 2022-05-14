ARG BASE_IMAGE=redhat/ubi8-init
ARG BASE_TAG=8.5

FROM ${BASE_IMAGE}:${BASE_TAG}

RUN groupadd -g 27 -r mediawiki && \
    useradd -u 27 -r -g mediawiki mediawiki && \
    dnf update -y && \
    dnf module -y reset php && \
    dnf module -y enable php:7.4 && \
    dnf install -y httpd php php-mysqlnd php-gd php-xml php-mbstring php-json php-intl php-apcu && \
    dnf clean -y all && \
    php-fpm

WORKDIR /home/mediawiki

ADD https://releases.wikimedia.org/mediawiki/1.37/mediawiki-1.37.2.tar.gz .
ADD https://releases.wikimedia.org/mediawiki/1.37/mediawiki-1.37.2.tar.gz.sig .

WORKDIR /var/www

RUN tar -zxf /home/mediawiki/mediawiki-1.37.2.tar.gz && \
    ln -s mediawiki-1.37.2/ mediawiki
    
COPY mediawiki/httpd-foreground /usr/local/bin/
COPY mediawiki/httpd.conf /etc/httpd/conf/httpd.conf

EXPOSE 80
CMD ["httpd-foreground"]