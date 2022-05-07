FROM php:8.0.1-apache

#RUN apk update && apk add curl git wget

#RUN apk add --update --no-cache --virtual .build-dependencies $PHPIZE_DEPS

RUN pecl update-channels

RUN docker-php-ext-install pdo pdo_mysql bcmath sockets opcache && docker-php-ext-enable opcache && pecl install apcu && docker-php-ext-enable apcu

WORKDIR /usr/local/etc/php/conf.d/

COPY config/docker/config/php/php.ini .

RUN touch /var/log/php_error.log && chown -R www-data:www-data /var/log/php_error.log

WORKDIR /var/www/html

COPY . .

EXPOSE 9000