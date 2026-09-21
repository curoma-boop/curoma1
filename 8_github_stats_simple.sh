#!/usr/bin/env bash
if [ $# -ne 1 ]; then
  echo "Использование: $0 owner/repo"
  exit 1
fi
echo "Упрощённая версия (без API)"
echo "Репозиторий: $1"
echo "Для полной версии нужны curl и jq, среда Linux/WSL."
