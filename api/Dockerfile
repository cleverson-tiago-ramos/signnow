FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    git curl zip unzip \
    libpng-dev libonig-dev libxml2-dev libzip-dev \
    libjpeg-dev libfreetype6-dev

# Configura GD corretamente
RUN docker-php-ext-configure gd --with-freetype --with-jpeg

RUN docker-php-ext-install \
    pdo_mysql mbstring exif pcntl bcmath gd zip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Copia configs
COPY docker/php-fpm.conf /usr/local/etc/php-fpm.conf
COPY docker/startup.sh /usr/local/bin/startup

RUN chmod +x /usr/local/bin/startup

ENTRYPOINT ["/usr/local/bin/startup"]