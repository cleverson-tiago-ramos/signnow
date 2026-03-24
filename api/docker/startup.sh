#!/bin/bash

echo "🚀 Subindo SIGNNOW..."

# Instala dependências
if [ ! -d "vendor" ]; then
    composer install
fi

# Cria .env se não existir
if [ ! -f ".env" ]; then
    cp .env.example .env
    php artisan key:generate
fi

# Permissões (IMPORTANTE)
chmod -R 775 storage bootstrap/cache

# Migrations (opcional)
php artisan migrate --force

# Cache (melhora performance)
php artisan config:cache
php artisan route:cache

echo "✅ Laravel pronto"

# Inicia PHP-FPM
php-fpm