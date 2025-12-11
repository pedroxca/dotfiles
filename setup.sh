#!/usr/bin/env bash

#########
# SETUP #
#########

set -e

. /etc/os-release

os="$ID"

if [[ "$os" -ne "ubuntu" ]]; then
  echo "Not on Ubuntu"
  exit
fi

######################
# update and upgrade #
######################
sudo apt update -y
sudo apt upgrade -y


############
# APT APPS #
############
apt_apps=(
"fortune"
"cowsay"
"curl"
"git"
"procps"
"file"
"apt-transport-https"
"wget"
"stow"
"tmux"
 )

####################
# INSTALL APT APPS #
####################

sudo apt install -y "${apt_apps[@]}"


#############
# BREW APPS #
#############

brew_apps=(
"fzf"
"ripgrep"
"fd"
"aha"
"bat"
"gh"
"gum"
"starship"
"eza"
"asdf"
)

################
# INSTALL BREW #
################

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


#####################
# INSTALL BREW APPS #
#####################

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" 2>/dev/null || true
brew install "${brew_apps[@]}"


##################
# LINK ALL FILES #
##################

stow -d ./dotfiles -t "$HOME" */

LOCAL_SRC"=$HOME/.local/src"

mkdir $HOME/dev
mkdir $HOME/dev/workspace

source "$LOCAL_SRC/setup/asdf.sh"
source $HOME/.bashrc



echo "Setup complete!"

echo -e $(cat <<'EOF'

#####################################
#                                   #
# REMEMBER TO DOWNLOAD A NERD FONT  #
#    FOR THE TERMINAL TO WORK       #
#                                   #
#####################################
EOF
)