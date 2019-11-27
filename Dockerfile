FROM php:7.3.6-fpm-alpine3.9

WORKDIR /var/www

RUN apk --no-cache add shadow bash mysql-client

RUN usermod -u 1000 www-data

RUN docker-php-ext-install pdo pdo_mysql

RUN ( curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer )

EXPOSE 9000
