#!/usr/bin/env bash
EXT="${1:-txt}"
echo "Ищем файлы с расширением .$EXT в текущей директории..."
find . -maxdepth 1 -type f -name "*.${EXT}"
