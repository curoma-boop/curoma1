#!/usr/bin/env bash

read -p "Введите первое число: " num1
read -p "Введите второе число: " num2

if ! [[ "$num1" =~ ^-?[0-9]+([.][0-9]+)?$ ]] || ! [[ "$num2" =~ ^-?[0-9]+([.][0-9]+)?$ ]]; then
  echo "Ошибка: нужно ввести числа."
  exit 1
fi

sum=$(echo "$num1 + $num2" | bc)
echo "Сумма: $sum"