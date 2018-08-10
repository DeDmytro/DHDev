#!/usr/bin/env bash

cd /var/www
chmod 777 -R /var/www/storage
chmod 777 -R /var/www/bootstrap/cache

php artisan key:generate
php artisan migrate:fresh --seed

php-fpm