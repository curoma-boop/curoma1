#!/usr/bin/env bash

if [ $# -ne 1 ]; then
  echo "Использование: $0 <файл>"
  exit 1
fi

FILE="$1"

if [ ! -f "$FILE" ]; then
  echo "Ошибка: файл '$FILE' не найден."
  exit 1
fi

lines=$(wc -l < "$FILE")
echo "Количество строк в $FILE: $lines"
