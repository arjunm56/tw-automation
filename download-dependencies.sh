#!/bin/bash

wget -O mariadb-server.rpm https://mirrors.aliyun.com/mariadb/yum/10.4/centos8-amd64/rpms/MariaDB-server-10.4.22-1.el8.x86_64.rpm
wget -O mariadb-client.rpm https://mirrors.aliyun.com/mariadb/yum/10.4/centos8-amd64/rpms/MariaDB-client-10.4.22-1.el8.x86_64.rpm
wget -O mariadb-common.rpm https://mirrors.aliyun.com/mariadb/yum/10.4/centos8-amd64/rpms/MariaDB-common-10.4.22-1.el8.x86_64.rpm
wget -O mariadb-shared.rpm https://mirrors.aliyun.com/mariadb/yum/10.4/centos8-amd64/rpms/MariaDB-shared-10.4.22-1.el8.x86_64.rpm
wget -O galera.rpm https://mirrors.aliyun.com/mariadb/yum/10.4/centos8-amd64/rpms/galera-4-26.4.9-1.el8.x86_64.rpm
wget -O boost.rpm http://mirror.centos.org/centos/8-stream/AppStream/x86_64/os/Packages/boost-program-options-1.66.0-10.el8.x86_64.rpm
wget -O RPM-GPG-KEY-MariaDB https://mirrors.aliyun.com/mariadb/yum/RPM-GPG-KEY-MariaDB

 rpm --import RPM-GPG-KEY-MariaDB && \
    dnf update -y && \
    dnf install -y mariadb-server.rpm mariadb-client.rpm mariadb-common.rpm mariadb-shared.rpm galera.rpm boost.rpm --setopt=tsflags=nodocs && \
    dnf clean all && \