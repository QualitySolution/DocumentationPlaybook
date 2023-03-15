#!/usr/bin/env bash
cd "$(dirname "$0")" #Изменяем текущую дерикторию, на ту в которой лежит скрипт, иначе при вызове скрипта из другой дериктории пути будут неправильными.
antora generate antora-playbook-author-mode.yml
INDEX_FILE=$(realpath "build/site/index.html")
echo ${INDEX_FILE}
xdg-open file://${INDEX_FILE}

sleep 2 #Без задержки браузер почему-то не окрывал страницу.
