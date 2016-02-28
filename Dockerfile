FROM nginx:1.9.9

MAINTAINER Delermando

ENV PHP_VERSION 5.6.14+dfsg-0+deb8u1

RUN apt-get update
RUN apt-get install -y php5=$PHP_VERSION
RUN apt-get install -y php5-fpm=$PHP_VERSION 
RUN apt-get install -y php5-mcrypt=$PHP_VERSION 
RUN apt-get install -y php5-curl=$PHP_VERSION 
RUN apt-get install -y php5-gd=$PHP_VERSION 
RUN apt-get install -y php5-mysql=$PHP_VERSION 
RUN apt-get install -y php5-cli=$PHP_VERSION 
RUN apt-get install -y memcached 
RUN apt-get install -y php5-memcache

RUN rm -rf /var/lib/apt/lists/*

RUN touch /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /var/www/html

EXPOSE 80 443

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
