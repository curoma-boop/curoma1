# Практическая работа: Nginx в Docker

## 1. Проверка версии Docker
Выполнил команду `docker version`.

![Скриншот версии Docker](images/docker_version.png)

## 2. Подготовка (Чистый лист)
Проверил наличие контейнеров, остановил и удалил все лишнее. Вывод команды `docker ps -a` пуст, так как очистка прошла успешно.

![Скриншот пустого списка контейнеров](images/clean_start.png)

## 3. Получение образа Nginx
Выполнил поиск образа в Docker Hub командой `docker search nginx`.

![Скриншот поиска nginx](images/nginx_search.png)

Запустил контейнер:
`docker run -d --name my-nginx -p 80:80 nginx`

Проверка работы через `curl` (получение HTML-кода):

![Скриншот curl](images/curl_nginx.png)

Проверка в браузере по адресу `http://localhost/` (стандартная страница Nginx):

![Скриншот стандартной страницы Nginx](images/nginx_browser.png)

## 4. Управление и мониторинг
Вошёл в контейнер и выполнил базовые команды Linux (`uname -a`, `cat /etc/os-release`):

![Скриншот вывода uname и os-release](images/linux_info.png)

Установил и запустил утилиты внутри контейнера:
- Fastfetch
- htop
- cmatrix
- cacafire
- hollywood

![Скриншот fastfetch](images/fastfetch.png)
![Скриншот cmatrix](images/cmatrix.png)
![Скриншот hollywood](images/hollywood.png)

## 5. Редактирование страницы приветствия
Отредактировал файл `/usr/share/nginx/html/index.html` внутри контейнера, заменив стандартный текст на свой.

Результат в браузере по адресу `http://localhost/`:

![Скриншот изменённой страницы в браузере](images/custom_index.png)

## 6. Очистка
Остановил и удалил все контейнеры и образы.

![Скриншот очистки](images/docker_cleanup.png)
