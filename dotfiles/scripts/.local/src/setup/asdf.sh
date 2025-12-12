#!/usr/bin/env bash

add_install_globalset() {
  asdf plugin add $1
  asdf install $1 $2
  asdf set $1 $2 --home
}

# dependencies=(
#   "java"
#   "nodejs"
#   "python"
# )
#
# for dependency in "${dependencies[@]}"; do
#   add_install_globalset "$dependency"
# done
#
#

add_install_globalset "java" "openjdk-21"
add_install_globalset "python" "latest"
add_install_globalset "nodejs" "latest"
