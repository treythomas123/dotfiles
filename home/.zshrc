source "$HOME/.homesick/repos/homeshick/homeshick.sh" 
fpath=($HOME/.homesick/repos/homeshick/completions $fpath) 
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

path=( $HOME/node/bin $path ) 
path=( $HOME/.npm-packages/bin $path ) 
NODE_PATH="$HOME/.npm-packages/lib/node_modules:$NODE_PATH" 
. ~/.nvm/nvm.sh
 
# vim 
 
set -o vi  
alias v="nvim"
alias vi="nvim"
alias vim="nvim" 
export TERM=xterm-256color 
 
# prompt

PS1="%F{245}%~ \$ %f" 
