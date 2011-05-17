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

ZSH_THEME="candy"
source $ZSH/oh-my-zsh.sh
export EDITOR=vim
xset b off

#############
# Variables #
#############

pad="`xsetwacom --list devices | grep 'type: PAD' | \
  sed 's/.*id: \([0-9][0-9]*\).*/\1/'`"
source ~/Programs/root-6.20.04/build/bin/thisroot.sh


###########
# ALIASES #
###########

# Text edit
alias plaspell="aspell -c -t --lang=pl"
alias pdflatex="pdflatex --interaction nonstopmode"
alias vimr="vim -R"
alias c="xclip"
alias v="xclip -o"

# GIT shortcuts
alias gst="git status"
alias ga="git add -A"
alias gc="git commit -m"
alias gpl="git pull"
alias gf="git fetch"
alias gp="git push"

# Local programs
alias macc="~/.local/bin/macc"

# Multimedia
alias exif="exiftool -all="

# Net
alias myip="curl http://ipecho.net/plain; echo"

# Package management
alias pacman_unused="pacman -Qtdq"

# Others
alias ..="cd .."
alias ...="cd ../.."
alias ls="ls -a --color=auto"

# YT
alias yt_mp3="youtube-dl  --extract-audio --audio-format mp3 --audio-quality 0 -f bestaudio "
alias yt_mp4="youtube-dl  -f mp4 "

# Tmux
alias tmux_return="tmux attach-session"

#############
# Functions #
#############

function ggit()
{
	git status
	git add --all
	sleep 3
	if [ $1 = "-S" ] 
	then
		echo "1"
		git commit -S -m "$2"
	else
		echo "2"
		git commit --no-gpg-sign -m "$1"
	fi
}

function cvim()
{
	realpath $1 | xclip
}

function vvim()
{
	vim $(xclip -o)
}

function rmexif()
{
	exif $1
	rm $1_original
}

function pip-upload()
{

	python setup.py sdist
	twine upload dist/*

	echo "Deleting dist/ ..."
	rm -rf dist *.egg-info
}

