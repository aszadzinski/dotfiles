#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export VISUAL=nvim;
export EDITOR=nvim;
alias vim=nvim

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias chtop=hop

function yvim()
{
	        realpath $1 > /tmp/yvim
}
function pvim()
{
	        vim $(cat /tmp/yvim)
}
function cvim()
{
	        realpath $1 | xclip
}
function vvim()
{
	        vim $(xclip -o)
}

