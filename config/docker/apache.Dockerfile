FROM php:5.4-apache

RUN pecl update-channels

RUN docker-php-ext-install pdo pdo_mysql bcmath sockets

WORKDIR /usr/local/etc/php/conf.d/

COPY config/docker/config/php/php.ini .

RUN touch /var/log/php_error.log && chown -R www-data:www-data /var/log/php_error.log

WORKDIR /var/www/html

COPY . .

EXPOSE 9000