FROM php:7.2.7-fpm

RUN apt-get update && apt-get install -y libmcrypt-dev \
    zlib1g-dev \
    mysql-client libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo_mysql

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer \
        --install-dir=/usr/local/bin && \
        echo "alias composer='composer'" >> /root/.bashrc && \
        composer


COPY / /var/www

WORKDIR /var/www

COPY .env.dev .env

EXPOSE 9000
ENTRYPOINT ["sh","run.sh"]
