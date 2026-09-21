#!/usr/bin/env bash
PROJECT_NAME="my-project"
mkdir -p "$PROJECT_NAME/css"
mkdir -p "$PROJECT_NAME/js"
touch "$PROJECT_NAME/index.html"
touch "$PROJECT_NAME/css/style.css"
touch "$PROJECT_NAME/js/script.js"
echo "Структура проекта $PROJECT_NAME создана."
find "$PROJECT_NAME" -print
