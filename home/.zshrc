typeset -aU path
path=( $HOME/bin $path )

# oh-my-zsh
ZSH=$HOME/.oh-my-zsh
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# node
path=( $HOME/.npm-packages/bin $path )
path=( ./node_modules/.bin $path )

# go
export GOPATH=$HOME

# python
export PYTHONDONTWRITEBYTECODE=1

# vi mode
set -o vi
bindkey -v '^?' backward-delete-char

# vim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
export TERM=xterm-256color

# git
alias gs="git status"
alias gds="git diff --staged"

# prompt
PS1="%K{235} %F{244}%~ %k%f%F{235} %f"

# completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
setopt menu_complete

# search command history with up/down
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
