#!/bin/bash

source $HOME/.local/src/scripts/app/scripts-utils.sh


while getopts ":d" opt; do
  case $opt in
    d)
      if [[ ! $descricao ]]; then
        echo "Descricao do comando não foi definida!"
        abort
      fi
      echo -e "$descricao" | gum format --theme=dark
      exit
      ;;
  esac
done
