# homeshick

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

# oh-my-zsh

ZSH=/Users/trey/.oh-my-zsh
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git)
export PATH="/Users/trey/.nvm/versions/node/v5.7.1/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin"
source $ZSH/oh-my-zsh.sh



# custom

set -o vi
alias vim="nvim"
export NVIM_TUI_ENABLE_TRUE_COLOR=1

PROMPT="%~ $ "
