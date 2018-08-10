FROM php:7.2.7-fpm

RUN apt-get update && apt-get install -y libmcrypt-dev \
    zlib1g-dev \
    mysql-client libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo_mysql

#CMD sudo chmod 777 -R storage
#CMD sudo chmod 777 -R bootstrap/cache
#CMD php artisan key:generate
#CMD php artisan config:cache
#CMD php artisan route:cache
#CMD php artisan migrate --force

EXPOSE 9000
ENTRYPOINT ["sh","docker/run.sh"]