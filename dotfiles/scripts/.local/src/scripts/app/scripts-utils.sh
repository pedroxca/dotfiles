#!/bin/bash

abort() {
  exit 9999
}

abort-if-empty() {
  if [[ $1 == "" ]]; then
    echo $2
    abort
  fi
}

open_file_in_firefox() {
  local caminho_do_arquivo=$1
  file_path=$(wslpath -w "$caminho_do_arquivo")
  "/mnt/c/Program Files (x86)/Mozilla Firefox/firefox.exe" "$file_path"
}


# Mensagem em itálico
italic="\e[3m"
reset="\e[0m"
