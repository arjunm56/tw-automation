ARG BASE_IMAGE=redhat/ubi8-init
ARG BASE_TAG=8.5

FROM ${BASE_IMAGE}:${BASE_TAG}

ENV MARIADB_MAJOR 10.4
ENV MARIADB_VERSION 10.4.22

# copy dependencies, GPG key
COPY bin/mariadb-server.rpm bin/mariadb-client.rpm bin/mariadb-common.rpm bin/mariadb-shared.rpm bin/galera.rpm bin/boost.rpm signatures/RPM-GPG-KEY-MariaDB /

# import GPG keys, update, install dependencies, and clean
# remove rpms/keys and allow exec permissions on entrypoint
RUN rpm --import RPM-GPG-KEY-MariaDB && \
    dnf update -y && \
    dnf install -y bin/mariadb-server.rpm bin/mariadb-client.rpm bin/mariadb-common.rpm bin/mariadb-shared.rpm bin/galera.rpm bin/boost.rpm --setopt=tsflags=nodocs && \
    dnf clean all && \
    rm -rf /var/cache/dnf && \
    rm -f mariadb-server.rpm mariadb-client.rpm mariadb-common.rpm mariadb-shared.rpm galera.rpm boost.rpm RPM-GPG-KEY-MariaDB RPM-GPG-KEY-CentOS-Official && \
    systemctl start mariadb && \
    mysql_secure_installation && \
    systemctl enable mariadb

USER mysql
