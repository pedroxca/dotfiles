#!/usr/bin/env bash

#########
# SETUP #
#########

set -euo pipefail

. /etc/os-release

os="$ID"

if [[ "$os" != "ubuntu" ]]; then
  echo "#####################################"
  echo "#                                   #"
  echo "#              NOT UBUNTU           #"
  echo "#                                   #"
  echo "#####################################"
  exit
fi


######################
# UPDATE AND UPGRADE #
######################
echo "#####################################"
echo "#                                   #"
echo "#       UPDATE AND UPGRADE...       #"
echo "#                                   #"
echo "#####################################"
sudo apt update -y
sudo apt upgrade -y

############
# APT APPS #
############
echo "#####################################"
echo "#                                   #"
echo "#            APT APPS...            #"
echo "#                                   #"
echo "#####################################"
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
  "jq"
  "zip"
  "unzip"
  "build-essential"
  "ca-certificates"
  "gnupg"
  "software-properties-common"

)

####################
# INSTALL APT APPS #
####################
echo "#####################################"
echo "#                                   #"
echo "#      INSTALLING APT APPS...       #"
echo "#                                   #"
echo "#####################################"

sudo apt install -y "${apt_apps[@]}"

#############
# BREW APPS #
#############
echo "#####################################"
echo "#                                   #"
echo "#            BREW APPS...           #"
echo "#                                   #"
echo "#####################################"

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
echo "#####################################"
echo "#                                   #"
echo "#           INSTALLING BREW...      #"
echo "#                                   #"
echo "#####################################"

NONINTERACTIVE=1

if command -v brew >/dev/null 2>&1; then
  echo "#####################################"
  echo "#                                   #"
  echo "#    BREW IS ALREADY INSTALLED      #"
  echo "#            SKIPPING...            #"
  echo "#                                   #"
  echo "#####################################"
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" </dev/null
fi

#####################
# INSTALL BREW APPS #
#####################
echo "#####################################"
echo "#                                   #"
echo "#        INSTALLING BREW APPS...    #"
echo "#                                   #"
echo "#####################################"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" 2>/dev/null || true
brew install "${brew_apps[@]}"

##################
# LINK ALL FILES #
##################
echo "#####################################"
echo "#                                   #"
echo "#           LINKING FILES...        #"
echo "#                                   #"
echo "#####################################"


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


stow --dir "$SCRIPT_DIR/dotfiles" --target $HOME bash scripts starship tmux



[ -f "$HOME/.bashrc.d/.mainrc" ] && echo "source "$HOME/.bashrc.d/.mainrc"" >> "$HOME/.bashrc"


LOCAL_SRC="$HOME/.local/src"

mkdir -p $HOME/dev/workspace

###################
# SETTING UP ASDF #
###################
echo "#####################################"
echo "#                                   #"
echo "#          SETTING UP ASDF...       #"
echo "#                                   #"
echo "#####################################"

chmod +x "$LOCAL_SRC/setup/asdf.sh"
$LOCAL_SRC/setup/asdf.sh

###################
# SETTING UP TMUX #
###################
echo "#####################################"
echo "#                                   #"
echo "#          SETTING UP TMUX...       #"
echo "#                                   #"
echo "#####################################"

chmod +x "$LOCAL_SRC/setup/tmux.sh"
$LOCAL_SRC/setup/tmux.sh

#################
# SOURCING BASH #
#################
echo "#####################################"
echo "#                                   #"
echo "#           SOURCING BASH...        #"
echo "#                                   #"
echo "#####################################"

source "$HOME/.bashrc"

echo "#####################################"
echo "#                                   #"
echo "#           SETUP COMPLETE!         #"
echo "#                                   #"
echo "#####################################"


echo "#####################################"
echo "#                                   #"
echo "# REMEMBER TO DOWNLOAD A NERD FONT  #"
echo "#    FOR THE TERMINAL TO WORK       #"
echo "#                                   #"
echo "#####################################"

