# DOCKER-VERSION 1.8.1
FROM    debian:jessie

MAINTAINER Daniel Fiebig, daniel@wellnow.de

ENV TZ=Europe/Berlin

RUN echo $TZ > /etc/timezone; dpkg-reconfigure -f noninteractive tzdata

VOLUME /var/www/src1

WORKDIR /var/www/src1

ADD ./src /var/www/src1
