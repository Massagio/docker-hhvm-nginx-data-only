# DOCKER-VERSION 1.8.1
FROM    debian:jessie

MAINTAINER Daniel Fiebig, daniel@massagio.de

ENV TZ=Europe/Berlin

RUN echo $TZ > /etc/timezone; dpkg-reconfigure -f noninteractive tzdata

VOLUME /var/www/src

WORKDIR /var/www/src

ADD ./src /var/www/src
