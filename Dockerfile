FROM php:8.3-apache
RUN apt update
RUN apt upgrade -y
RUN apt install -y imagemagick

ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN install-php-extensions gd mysqli pdo_mysql imagick

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY my-php.ini /usr/local/etc/php/conf.d/my-php.ini

RUN a2enmod rewrite

RUN echo "ServerName jason4bury.org" >> /etc/apache2/apache2.conf