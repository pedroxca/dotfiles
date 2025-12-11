#!/usr/bin/env bash



add_install_globalset() {
  asdf plugin add $1
  asdf plugin install $1 latest
  asdf plugin set --home $1 latest
}

dependencies=(
  "java"
  "nodejs"
  "python"
)

for dependency in "${dependencies[@]}"; do
  add_install_globalset "$dependency"
done

