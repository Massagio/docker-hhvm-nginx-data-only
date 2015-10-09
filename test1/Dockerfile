# DOCKER-VERSION 1.8.1
FROM    debian:jessie

MAINTAINER Daniel Fiebig, daniel@massagio.de

ENV TZ=Europe/Berlin

RUN echo $TZ > /etc/timezone; dpkg-reconfigure -f noninteractive tzdata

# Update cache and install base packages

# RUN apt-get update && apt-get -y install \
#     software-properties-common \
#     python-software-properties \
#     debian-archive-keyring \
#     wget \
#     curl \
#     vim \
#     nano \
#     aptitude \
#     dialog \
#     net-tools \
#     mcrypt \
#     build-essential \
#     tcl8.5 \
#     git

#     RUN apt-get update && apt-get install -y openssh-server apache2 supervisor
#     RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor
#     COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
#     CMD ["/usr/bin/supervisord"]

# RUN wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | apt-key add -

# RUN echo deb http://dl.hhvm.com/debian jessie main | tee /etc/apt/sources.list.d/hhvm.list

# Update cache and install Nginx
# RUN apt-get update && apt-get -y install \
#     hhvm

# VOLUME ["/usr/share/nginx/html"]
# Mount volumes
VOLUME /var/www

# Auto-configure HHVM
# CMD sh /usr/share/hhvm/install_fastcgi.sh

# Start up HHVM on next boot
# RUN update-rc.d hhvm defaults

# Boot up Nginx, and HHVM when container is started
# CMD service hhvm start

# RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin \
#     composer config -g github-oauth.github.com 247948847ab782b25b61ce9228fd78bd0b7f1ee8 \
# 	  composer global require "fxp/composer-asset-plugin:~1.0.0"

# Set the current working directory
# TODO: add SQL migration
# WORKDIR /usr/share/nginx/html

WORKDIR /var/www

# RUN useradd -u 1000 docker

ADD ./application /var/www
# RUN chown -R www-data:www-data /var/www
