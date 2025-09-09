#!/bin/bash

# Получаем текущий хэш коммита
OLD_HEAD=$(git rev-parse HEAD)

# Делаем git pull
echo "Выполняем git pull..."
git pull

# Получаем новый хэш коммита
NEW_HEAD=$(git rev-parse HEAD)

# Проверяем, есть ли изменения
if [ "$OLD_HEAD" != "$NEW_HEAD" ]; then
    echo "Обнаружены изменения. Перезапускаем приложение..."

    # Останавливаем PM2 процесс
    echo "Останавливаем PM2 процесс..."
    pm2 delete ecosystem.config.js

    # Выполняем сборку
    echo "Выполняем npm run build..."
    npm run build

    # Запускаем PM2 процесс
    echo "Запускаем PM2 процесс..."
    pm2 start ecosystem.config.js

    echo "Деплой завершен успешно."
else
    echo "Изменений не обнаружено. Ничего не делаем."
fi
