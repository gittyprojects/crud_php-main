#!/bin/bash
set -e

# Generate APP_KEY if not set
if ! php artisan key:generate --check; then
    php artisan key:generate
fi

# Clear caches safely
php artisan config:clear || true
php artisan route:clear || true
php artisan cache:clear || true

# Start Apache in foreground
apache2-foreground
