typeset -aU path
path=( $HOME/bin $path )

# untracked local environment vars
source ~/.local.env

# homebrew
path=( /usr/local/bin $path ) 

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
bindkey -v
bindkey '^?' backward-delete-char
bindkey '^Xh' _complete_help

# vim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
export TERM=xterm-256color

# git
alias gs="git status"
alias gds="git diff --staged"
alias gdm="git diff master"
alias gcof='f() { git checkout feature/$1 };f'
alias ge-personal="git config user.email $PERSONAL_EMAIL"
alias ge-work="git config user.email $WORK_EMAIL"

# move multiple
autoload -U zmv
alias mmv='noglob zmv -W'

# prompt
PS1="%K{234} %F{244}%~ %k%f%F{234} %f"

# completion
zstyle ':completion:*' menu select
setopt menu_complete
bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'w' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect '0' vi-beginning-of-line
bindkey -M menuselect '$' vi-end-of-line

# search command history with up/down
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
