ARG BASE_IMAGE=redhat/ubi8-init
ARG BASE_TAG=8.5

FROM ${BASE_IMAGE}:${BASE_TAG}

ENV MARIADB_MAJOR 10.4
ENV MARIADB_VERSION 10.4.22

# copy dependencies, GPG key
COPY *.rpm /
COPY RPM-GPG-KEY-MariaDB /
RUN rpm --import RPM-GPG-KEY-MariaDB

# import GPG keys, update, install dependencies, and clean
# remove rpms/keys and allow exec permissions on entrypoint
RUN dnf update -y && \
    dnf install -y mariadb-server.rpm mariadb-client.rpm mariadb-common.rpm mariadb-shared.rpm galera.rpm boost.rpm --setopt=tsflags=nodocs && \
    dnf clean all && \
    rm -rf /var/cache/dnf && \
    rm -f mariadb-server.rpm mariadb-client.rpm mariadb-common.rpm mariadb-shared.rpm galera.rpm boost.rpm RPM-GPG-KEY-MariaDB RPM-GPG-KEY-CentOS-Official

USER mysql

EXPOSE 3306
CMD ["mysqld","--user=root"]
