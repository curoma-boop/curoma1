#!/usr/bin/env bash
set -euo pipefail

YELLOW='\033[0;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;4m'
NC='\033[0m'

usage() {
  echo "Использование: $0 owner/repo"
  echo "Пример: $0 tensorflow/tensorflow"
  exit 1
}

check_deps() {
  for cmd in curl jq; do
    if ! command -v "$cmd" &> /dev/null; then
      echo "Ошибка: требуется утилита '$cmd'. Установите её или используйте упрощённую версию."
      exit 1
    fi
  done
}

format_number() {
  local num=$1
  echo "$num" | sed ':a;s/\B[0-9]\{3\}\>/,&/;ta'
}

main() {
  check_deps

  if [ $# -ne 1 ]; then
    usage
  fi

  REPO="$1"

  if ! [[ "$REPO" =~ ^[^/]+/.+$ ]]; then
    echo "Ошибка: неверный формат. Используйте owner/repo (например, octocat/Hello-World)."
    exit 1
  fi

  API_URL="https://api.github.com/repos/$REPO"
  response=$(curl -s -H "Accept: application/vnd.github+json" "$API_URL")
  status=$(echo "$response" | jq -r '.message // empty')

  if [[ -n "$status" ]]; then
    if [[ "$status" == "Not Found" ]]; then
      echo "Ошибка: репозиторий '$REPO' не найден."
    elif [[ "$status" == *"rate limit"* ]]; then
      echo "Ошибка: превышен лимит запросов к GitHub API (подождите ~1 час)."
    else
      echo "Ошибка GitHub API: $status"
    fi
    exit 1
  fi

  name=$(echo "$response" | jq -r '.name // "unknown"')
  owner=$(echo "$response" | jq -r '.owner.login // "unknown"')
  stars=$(echo "$response" | jq '.stargazers_count // 0')
  forks=$(echo "$response" | jq '.forks_count // 0')
  language=$(echo "$response" | jq -r '.language // "не указан"')

  echo -e "${BLUE}Репозиторий:${NC} $owner/$name"
  echo -e "${GREEN}Язык:${NC} $language"
  echo -e "${GREEN}★ Звёзд:${NC} $(format_number "$stars")"
  echo -e "${YELLOW}🔀 Форков:${NC} $(format_number "$forks")"
}

main "$@"
