FROM ubuntu:16.04
MAINTAINER arjun

RUN apt-get update -y && \
    apt-get install -y curl unzip apache2 php php-mysql php-curl libapache2-mod-php php-cli php-mcrypt php-mbstring php-ldap php-xml php-sqlite3 && \
    a2enmod rewrite && 
    rm /var/www/html/index.html && \
    echo "<?php phpinfo(); ?>" > /var/www/html/index.php && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD entrypoint.sh /
ENTRYPOINT ["bash", "/entrypoint.sh"]
WORKDIR "/var/www/html"
EXPOSE 80
