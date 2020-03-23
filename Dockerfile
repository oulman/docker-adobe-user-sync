FROM centos:7

ENV VERSION="v2.5"

RUN yum update -y
RUN yum groupinstall -y "Development Tools"
RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm epel-release 
RUN yum install -y python36u-devel \
    python36u-pip \ 
    python36u-virtualenv \
    pkgconfig \
    openssl-devel \
    openldap-devel \
    dbus-glib-devel \
    dbus-python \
    libffi-devel \
    wget 

RUN mkdir -p /app/examples

WORKDIR /app

RUN wget -q -O /app/user-sync.tar.gz https://github.com/adobe-apiplatform/user-sync.py/releases/download/${VERSION}/user-sync-${VERSION}-centos7-py368.tar.gz && \
    tar -xvf /app/user-sync.tar.gz -C /app && \
    rm /app/user-sync.tar.gz && \
    wget -q -O /app/examples.tar.gz https://github.com/adobe-apiplatform/user-sync.py/releases/download/${VERSION}/examples.tar.gz && \
    tar -xvf /app/examples.tar.gz -C /app/examples && \
    rm /app/examples.tar.gz
