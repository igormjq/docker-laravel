#!/bin/bash

echo "Waiting for database to get ready"
dockerize -wait tcp://db:3306 -timeout 40s

echo "Installing dependencies"
composer install

echo "Generating app key"
php artisan key:generate

echo "Running migrations..."
php artisan migrate

echo "Starting PHP FPM"
php-fpm