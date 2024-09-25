typeset -aU path
path=( $HOME/bin $path )

# homebrew
path=( /usr/local/bin $path )

# oh-my-zsh
ZSH=$HOME/.oh-my-zsh
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_MAGIC_FUNCTIONS="true"
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
path=( /opt/homebrew/opt/go@1.23/bin $path )

# python
path=( /opt/homebrew/opt/python@3.10/libexec/bin $path )

# ruby
path=( /opt/homebrew/opt/ruby/bin $path )
path=( /opt/homebrew/lib/ruby/gems/3.1.0/bin $path )

# vi mode
bindkey -v
bindkey '^?' backward-delete-char
bindkey '^Xh' _complete_help

# vim
alias v="vim"
export TERM=xterm-256color
export EDITOR=vim

# git
alias gs="git status"
alias gds="git diff --staged"
alias gdm="git diff master"
alias gcof='f() { git checkout feature/$1 };f'
alias ge-personal="git config user.email $PERSONAL_EMAIL"
alias ge-work="git config user.email $WORK_EMAIL"

# kubectl
alias k="kubectl"
alias kns="kubectl config set-context --current --namespace"
alias mk="minikube"
source <(kubectl completion zsh)

# terraform
alias tf="terraform"

# move multiple
autoload -U zmv
alias mmv='noglob zmv -W'

# use gnu sed
path=( /usr/local/opt/gnu-sed/libexec/gnubin $path )

# prompt
PS1="%(?..%F{196}%?%f )%F{117}%~ ❯ %f"
PROMPT_EOL_MARK=''

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

# Avoid removing auto-completed space char when typing "|" (default is " \t\n;&|")
ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;&'

# allow expansion of next alias when using "watch"
alias watch='watch '

# search command history with up/down
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# fail whole pipeline if any command fails
set -o pipefail

# jq parsing to colorize logs that might contain non-json lines
alias jqlog='jq -cr --raw-input '"'"'. as $line | try (fromjson) catch $line'"'"
alias jqlogsimple='jq -cr --raw-input '"'"'. as $line | try (fromjson | (.timestamp + " [" + .level + "] " + .msg)) catch $line'"'"
alias jqlogscolor='jq -cr --raw-input '"'"'. as $line | try (fromjson | (.timestamp + " [" + .level + "] " + .msg), (. | del(.timestamp, .level, .msg, .application, .component))) catch $line'"'"

alias jqlogsold='jq -cr --raw-input '"'"'. as $line | try (fromjson | (.timestamp + " [" + .level + "] " + .msg) + (. | del(.timestamp, .level, .msg, .application, .component) | tojson | " \u001b[30m" + . + "\u001b[0m")) catch $line'"'"

jqlogs() {
  jq -cr --raw-input '
    def levelColor: {
      "debug": "\u001b[38;5;81m",
      "info": "\u001b[38;5;157m",
      "warn": "\u001b[38;5;208m",
      "error": "\u001b[38;5;203m",
      "fatal": "\u001b[38;5;203m"
    };
    . as $line |
    try (
      fromjson |
      (.timestamp + (try(levelColor[.level]) catch "") + " [" + .level + "] " + "\u001b[0m" + .msg) +
        (. |
          del(.timestamp, .level, .msg, .application, .component) |
          tojson |
          " \u001b[30m" + . + "\u001b[0m"
        )
    ) catch $line'
}

jqlogsall() {
  jq -cr --raw-input '
    def levelColor: {
      "debug": "\u001b[38;5;81m",
      "info": "\u001b[38;5;157m",
      "warn": "\u001b[38;5;208m",
      "error": "\u001b[38;5;203m",
      "fatal": "\u001b[38;5;203m"
    };
    . as $line |
    try (
      fromjson |
      (.timestamp + (try(levelColor[.level]) catch "") + " [" + .level + "] " + "\u001b[0m" + .msg) +
        (. |
          tojson |
          " \u001b[30m" + . + "\u001b[0m"
        )
    ) catch $line'
}


# untracked local environment vars
source ~/.local.env
