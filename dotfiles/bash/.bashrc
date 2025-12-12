HOST_NAME=Pedro

shopt -s autocd
shopt -s histappend
export PATH=$PATH:$HOME/bin

export HISTSIZE=5000
export HISTFILESIZE=10000

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# txtred='\[\e[0;31m\]' # Red
# txtgrn='\[\e[0;32m\]' # Green
# bldgrn='\[\e[1;32m\]' # Bold Green
# bldpur='\[\e[1;35m\]' # Bold Purple
# txtrst='\[\e[0m\]'    # Text Reset

# parse_git_branch() {
#         git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
# }

# print_before_the_prompt () {
#     dir=$PWD
#     home=$HOME
#     dir=${dir/"$HOME"/"~"}
#     git_branch="$(parse_git_branch)"
#     dir_git=$(basename "`pwd`")
#     if [[ -n "$git_branch" ]]
#     then
#       PS1="\n$txtred $dir_git$bldpur in $(parse_git_branch)$txtgrn $(date +%H:%M)$txtrst\n$txtgrn $txtrst "
#     else
#       PS1="\n$txtred$dir $txtgrn $(date +%H:%M)$txtrst\n$txtgrn $txtrst "
#     fi
#
# }

# PROMPT_COMMAND=print_before_the_prompt
# PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
PATH=$PATH:~/.cargo/bin/
PATH=$PATH:/usr/local/go/bin
PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

. ~/.asdf/plugins/java/set-java-home.bash

fortune | cowsay -f tux

###############
# COMPLETIONS #
###############
eval "$(starship init bash)"
eval "$(fzf --bash)"
. <(asdf completion bash)

source $HOME/.custom_aliases

export WORKSPACE="$HOME/dev/workspace"

