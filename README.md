# Bash Programming Self-Study

Набор Bash-скриптов для выполнения заданий.

## Список скриптов

- `1_greeting.sh` — запрашивает имя и выводит приветствие.
- `2_sum_calculator.sh` — калькулятор суммы двух целых чисел.
- `3_even_odd.sh` — проверяет чётность числа.
- `4_project_structure.sh` — создаёт структуру папок для веб-проекта.
- `5_line_counter.sh` — подсчитывает количество строк в файле.
- `6_password_generator.sh` — генерирует пароль из 8 символов.
- `7_find_by_extension.sh` — ищет файлы по расширению.

## Как запустить

1. Сделайте скрипты исполняемыми:
   ```bash
   chmod +x *.sh
./1_greeting.sh
./5_line_counter.sh test.txt
cat > 8_github_stats.sh << 'EOF'
#!/usr/bin/env bash
set -euo pipefail

# Цвета
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

usage() {
  echo "Использование: $0 owner/repo"
  echo "Пример: $0 tensorflow/tensorflow"
  exit 1
}

check_deps() {
  for cmd in curl jq; do
    if ! command -v "$cmd" &> /dev/null; then
      echo "Ошибка: требуется утилита '$cmd'. Установите её."
      exit 1
    fi
  done
}

format_number() {
  local num=$1
  # Простая группировка тысяч
  echo "$num" | sed ':a;s/\B[0-9]\{3\}\>/,&/;ta'
}

main() {
  check_deps

  if [ $# -ne 1 ]; then
    usage
  fi

  REPO="$1"

  if ! [[ "$REPO" =~ ^[^/]+/.+$ ]]; then
    echo "Ошибка: неверный формат репозитория. Используйте owner/repo."
    exit 1
  fi

  API_URL="https://api.github.com/repos/$REPO"
  response=$(curl -s -H "Accept: application/vnd.github+json" "$API_URL")
  status=$(echo "$response" | jq -r '.message // empty')

  if [[ -n "$status" ]]; then
    if [[ "$status" == "Not Found" ]]; then
      echo "Ошибка: репозиторий '$REPO' не найден."
    elif [[ "$status" == *"rate limit"* ]]; then
      echo "Ошибка: превышен лимит запросов к GitHub API."
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
  created_at=$(echo "$response" | jq -r '.created_at // "unknown"')
  updated_at=$(echo "$response" | jq -r '.updated_at // "unknown"')
  description=$(echo "$response" | jq -r '.description // "нет описания"')

  echo -e "${BLUE}Репозиторий:${NC} $owner/$name"
  echo -e "${GREEN}Описание:${NC} $description"
  echo -e "${YELLOW}Язык:${NC} $language"
  echo -e "${GREEN}★ Звёзд:${NC} $(format_number "$stars")"
  echo -e "${YELLOW}🔀 Форков:${NC} $(format_number "$forks")"
  echo -e "${RED}Дата создания:${NC} $created_at"
  echo -e "${RED}Последнее обновление:${NC} $updated_at"
}

main "$@"
