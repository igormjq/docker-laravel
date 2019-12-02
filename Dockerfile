FROM php:7.3.6-fpm-alpine3.9

WORKDIR /var/www

RUN apk --no-cache add shadow bash mysql-client

RUN usermod -u 1000 www-data

RUN docker-php-ext-install pdo pdo_mysql

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN ( curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer )

EXPOSE 9000
