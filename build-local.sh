#!/usr/bin/env bash
antora generate antora-playbook-author-mode.yml
INDEX_FILE=$(realpath "build/site/index.html")
echo ${INDEX_FILE}
xdg-open file://${INDEX_FILE}
