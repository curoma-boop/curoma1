#!/usr/bin/env bash

read -p "Введите первое число: " num1
read -p "Введите второе число: " num2

if ! [[ "$num1" =~ ^-?[0-9]+$ ]] || ! [[ "$num2" =~ ^-?[0-9]+$ ]]; then
  echo "Ошибка: нужно ввести целые числа."
  exit 1
fi

sum=$((num1 + num2))
echo "Сумма: $sum"
