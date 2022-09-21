export ZSH="/data/data/com.termux/files/home/.oh-my-zsh"

ZSH_THEME="gnzh" # set by `omz`
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias vim=nvim
VISUAL=nvim
EDITOR=nvim

#clear
#if [ "$TMUX" = "" ]; then tmux; fi

