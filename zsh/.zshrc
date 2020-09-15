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
NPM_PACKAGES="${HOME}/.npm-packages"
NVM_DIR="$HOME/.nvm"
alias nvminit='. "/usr/local/opt/nvm/nvm.sh"'

# go
export GOPATH=$HOME

# python
export PYTHONDONTWRITEBYTECODE=1
path=( /Users/trey/Library/Python/3.7/bin $path )
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# ruby
path=( /usr/local/lib/ruby/gems/2.6.0/bin $path )
path=( /usr/local/opt/ruby/bin $path )

# tmux
alias t="tmux"

# vi mode
bindkey -v
bindkey '^?' backward-delete-char
bindkey '^Xh' _complete_help

# vim
alias v="vim"
export TERM=xterm-256color

# git
alias gs="git status"
alias gds="git diff --staged"
alias gdm="git diff master"
alias gcof='f() { git checkout feature/$1 };f'
alias ge-personal="git config user.email $PERSONAL_EMAIL"
alias ge-work="git config user.email $WORK_EMAIL"

# kubectl
alias k="kubectl"
alias mk="minikube"

# terraform
alias tf="terraform"

# move multiple
autoload -U zmv
alias mmv='noglob zmv -W'

# prompt
PS1="%K{237} %F{253}%~ %k%f%F{237} %f"

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
autoload bashcompinit
bashcompinit

# search command history with up/down
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

