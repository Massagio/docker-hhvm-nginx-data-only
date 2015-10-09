# DOCKER-VERSION 1.8.1
FROM    debian:jessie

MAINTAINER Daniel Fiebig, daniel@massagio.de

ENV TZ=Europe/Berlin

RUN echo $TZ > /etc/timezone; dpkg-reconfigure -f noninteractive tzdata

RUN echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list.d/nginx.list
RUN apt-key adv --fetch-keys "http://nginx.org/keys/nginx_signing.key"

RUN apt-get update && \
    apt-get install -y openssl ca-certificates nginx && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get -y install \
		nano \
		vim

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log
RUN mkdir /etc/nginx/sites-enabled/

# RUN chown -R www-data:www-data /var/www

COPY nginx.conf /etc/nginx/nginx.conf

COPY default.conf /etc/nginx/sites-available/

RUN ln -nfs /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

VOLUME ["/var/cache/nginx"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
