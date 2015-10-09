# DOCKER-VERSION 1.8.1
FROM    baptistedonaux/hhvm

MAINTAINER Daniel Fiebig, daniel@massagio.de

ENV TZ=Europe/Berlin
RUN echo $TZ > /etc/timezone; dpkg-reconfigure -f noninteractive tzdata

ENV PHP_INI_DIR /etc/hhvm/
RUN mkdir $PHP_INI_DIR

RUN apt-get update && apt-get -y install \
		nano \
		vim

COPY hhvm-ext-* /usr/local/bin/

COPY conf/php.ini $PHP_INI_DIR/
ADD conf/server.ini $PHP_INI_DIR/
ADD conf/hhvm.ini $PHP_INI_DIR/
ADD conf/hhvm.conf $PHP_INI_DIR/

RUN mkdir /var/run/hhvm

# CMD ["hhvm", "--mode", "server"]
