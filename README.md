# Linux Setup Script

![Ubuntu](https://img.shields.io/badge/OS-Ubuntu-E95420?logo=ubuntu&logoColor=white)
![Shell](https://img.shields.io/badge/Shell-Bash-4EAA25?logo=gnu-bash&logoColor=white)
![Package Manager](https://img.shields.io/badge/Package%20Manager-APT%20%2B%20Homebrew-0F1689)
![Dotfiles](https://img.shields.io/badge/Dotfiles-GNU%20Stow-blue)
![Status](https://img.shields.io/badge/Status-Stable-brightgreen)

Opinionated, reproducible Linux (Ubuntu) setup for a modern developer environment. This script bootstraps a fresh Ubuntu system with essential tools, modern CLI utilities, Homebrew, dotfiles, and development tooling using asdf.

## Features

- System update and upgrade
- Essential APT packages installation
- Homebrew installation (Linux)
- Modern CLI tools via Homebrew
- Dotfiles management using GNU Stow
- Starship prompt configuration
- tmux setup
- asdf installation and configuration
- Development directory bootstrap

## Installed Software

### APT Packages

- curl
- git
- wget
- stow
- tmux
- jq
- zip
- unzip
- fortune
- cowsay
- procps
- file
- apt-transport-https

### Homebrew Packages

- fzf
- ripgrep
- fd
- bat
- eza
- gh
- gum
- aha
- starship
- asdf

## Directory Structure

The script creates the following directories if they do not exist:

$HOME/ ├── dev/
           │   
           └── workspace/ 
       ├── .local/ 
           │   
           └── src/
       └── .config/

## Dotfiles Management

Dotfiles are managed using GNU Stow. Expected repository structure:

dotfiles/ 
    ├── bash/     
    ├── scripts/     
    ├── starship/ 
        └── tmux/

Behavior:
- Existing .bashrc is backed up
- Dotfiles are symlinked into $HOME
- Configuration is modular and reproducible

## Requirements

- Ubuntu or Ubuntu-based distribution
- sudo privileges
- Internet access

The script exits immediately if the OS is not Ubuntu.

## Usage

```bash
git clone https://github.com/pedroxca/dotfiles
cd dotfiles 
chmod +x setup.sh
./setup.sh
```

Recommended usage on a fresh system.

## Fonts

To properly render icons and glyphs in Starship, tmux, and modern CLI tools, install a Nerd Font and configure your terminal to use it.

Recommended fonts:
- MesloLGS Nerd Font
- JetBrainsMono Nerd Font
- FiraCode Nerd Font

## Idempotency

The script is designed to be mostly idempotent. It is safe to re-run, skips already installed tools, and re-links dotfiles cleanly. Some steps, such as backups, may create additional files when executed multiple times.

## Customization

You may want to customize the APT package list, Homebrew package list, asdf plugins and default versions, dotfiles content, and shell configuration.

## Notes

This is an opinionated setup. Review the script before running it. Avoid running it on production systems without understanding the changes it makes.

## Roadmap

- Zsh and Fish support
- Optional GUI tools
- Automatic asdf plugin installation
- SSH key generation
- Git global configuration bootstrap
- Firewall setup (ufw)

## License

Use it, fork it, modify it, break it. No warranties. No guarantees.
