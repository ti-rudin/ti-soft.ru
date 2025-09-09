#!/bin/bash

# Установка строгого режима
set -e

# Конфигурация
PROJECT_DIR="/home/rudin/ti-soft.ru"
LOG_FILE="/home/rudin/deploy.log"
BRANCH="main"  # или "master", в зависимости от вашей ветки

# Функция для логирования
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Функция для обработки ошибок
error_exit() {
    log "ОШИБКА: $1"
    exit 1
}

# Переход в директорию проекта
cd "$PROJECT_DIR" || error_exit "Не могу перейти в директорию $PROJECT_DIR"

# Начало выполнения
log "=== ЗАПУСК ДЕПЛОЯ ==="
log "Текущая директория: $(pwd)"
log "Ветка: $BRANCH"

# Проверка что это git репозиторий
if [ ! -d ".git" ]; then
    error_exit "Это не git репозиторий!"
fi

# Проверка наличия remote origin
if ! git remote -v | grep -q "origin"; then
    error_exit "Не настроен remote origin"
fi

# Получаем текущий хэш коммита
OLD_HEAD=$(git rev-parse HEAD)
log "Текущий коммит: $OLD_HEAD"

# Делаем git pull
log "Выполняем git pull..."
git fetch origin
git pull origin "$BRANCH" || error_exit "Ошибка при выполнении git pull"

# Получаем новый хэш коммита
NEW_HEAD=$(git rev-parse HEAD)
log "Новый коммит: $NEW_HEAD"

# Проверяем, есть ли изменения
if [ "$OLD_HEAD" != "$NEW_HEAD" ]; then
    log "Обнаружены изменения. Начинаем деплой..."
    
    # Проверяем наличие package.json
    if [ ! -f "package.json" ]; then
        error_exit "Файл package.json не найден"
    fi
    
    # Устанавливаем зависимости
    #log "Устанавливаем npm зависимости..."
    #npm install || error_exit "Ошибка при установке зависимостей"
    
    # Проверяем наличие скрипта build
    #if ! npm run | grep -q "build"; then
    #    error_exit "Скрипт build не найден в package.json"
    #fi
    
    # Выполняем сборку
    log "Выполняем npm run build..."
    npm run build || error_exit "Ошибка при сборке"
    
    # Проверяем наличие PM2
    if ! command -v pm2 &> /dev/null; then
        error_exit "PM2 не установлен"
    fi
    
    # Проверяем наличие конфига PM2
    if [ ! -f "ecosystem.config.js" ]; then
        error_exit "Файл ecosystem.config.js не найден"
    fi
    
    # Останавливаем PM2 процесс (если запущен)
    log "Останавливаем PM2 процесс..."
    if pm2 list | grep -q "ecosystem.config.js"; then
        pm2 delete ecosystem.config.js || log "Предупреждение: не удалось остановить PM2 процесс (возможно не был запущен)"
    else
        log "PM2 процесс не был запущен"
    fi
    
    # Запускаем PM2 процесс
    log "Запускаем PM2 процесс..."
    pm2 start ecosystem.config.js || error_exit "Ошибка при запуске PM2"
    
    # Сохраняем список процессов PM2
    pm2 save || log "Предупреждение: не удалось сохранить список процессов PM2"
    
    log "Деплой завершен успешно."
    
    # Выводим статус PM2
    log "Текущий статус PM2:"
    pm2 status | tee -a "$LOG_FILE"
    
else
    log "Изменений не обнаружено. Пропускаем деплой."
fi

log "=== ЗАВЕРШЕНИЕ ДЕПЛОЯ ==="