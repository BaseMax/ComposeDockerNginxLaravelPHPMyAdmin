FROM php:8.0-fpm

RUN apt-get update && apt-get install -y \
    libonig-dev \
    libzip-dev \
    zip \
    unzip \
    && docker-php-ext-install pdo_mysql mbstring zip

WORKDIR /var/www/html

COPY --chown=www-data:www-data ./src /var/www/html

CMD php artisan serve --host=0.0.0.0 --port=8000

EXPOSE 8000
