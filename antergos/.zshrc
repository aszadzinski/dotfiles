###############
# .zshrc file #
###############

export ZSH="/home/albert/.oh-my-zsh"
plugins=(
  git
	)

#################
# Configuration #
#################

ZSH_THEME="wezm"
source $ZSH/oh-my-zsh.sh
export EDITOR=vim
xset b off

#############
# Variables #
#############

pad="`xsetwacom --list devices | grep 'type: PAD' | \
  sed 's/.*id: \([0-9][0-9]*\).*/\1/'`"

###########
# ALIASES #
###########

# Text edit
alias plaspell="aspell -c -t --lang=pl"
alias pdflatex="pdflatex --interaction nonstopmode"
alias vimr="vim -R"

# GIT shortcuts
alias gst="git status"
alias ga="git add -A"
alias gc="git commit -m"
alias gpl="git pull"
alias gf="git fetch"
alias gp="git push"

# Local programs
alias macc="~/.local/bin/macc"
alias tor-opera="opera --proxy-server="socks://192.168.0.12:9100""

# Multimedia
alias exif="exiftool -all="

# Net
alias myip="curl http://ipecho.net/plain; echo"

# Others
alias ..="cd .."
alias ...="cd ../.."
alias c="xclip"
alias v="xclip -o"
alias ls="ls -a --color=auto"

#############
# Functions #
#############

function tomp4() 
{
	name=`echo "$1" | awk -F"." '{print $1}'`
	ffmpeg -i $1 $name.mp4
}

function rmexif()
{
	exif $1
	rm $1_original
}

