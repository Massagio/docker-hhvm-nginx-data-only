# DOCKER-VERSION 1.8.1
FROM nginx

MAINTAINER Daniel Fiebig, daniel@massagio.de

# Update cache and install base packages
RUN apt-get update && apt-get -y install \
    software-properties-common \
    python-software-properties \
    debian-archive-keyring \
    wget \
    curl \
    vim \
    nano \
    aptitude \
    dialog \
    net-tools \
    mcrypt \
    build-essential \
    tcl8.5 \
    git

# Update permissions
# RUN chown -R www-data:www-data /var/www/html

# Mount volumes
VOLUME ["/usr/share/nginx/html"]

# Set the current working directory
# TODO: add SQL migration
WORKDIR /usr/share/nginx/html

RUN usermod -u 1000 www-data
RUN usermod -a -G users www-data

ADD ./application /usr/share/nginx/html
RUN chown -R www-data:www-data /usr/share/nginx/html
