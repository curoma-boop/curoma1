#!/usr/bin/env bash
read -p "Введите число: " number

if ! [[ "$number" =~ ^-?[0-9]+$ ]]; then
  echo "Ошибка: введите целое число."
  exit 1
fi

if (( number % 2 == 0 )); then
  echo "$number — чётное."
else
  echo "$number — нечётное."
fi
