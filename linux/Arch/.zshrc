###############
# .zshrc file #
###############

#xmodmap -e "keycode 67=Page_Up"
#xmodmap -e "keycode 68=Page_Down"

export ZSH="/home/albert/.oh-my-zsh"
plugins=(
  git
	)
eval $(thefuck --alias)
export VISUAL=nvim;
export EDITOR=nvim;
alias vim="nvim"

#################
# Configuration #
#################

ZSH_THEME="gnzh" # set by `omz`
source $ZSH/oh-my-zsh.sh
export EDITOR=vim
xset b off

#############
# Variables #
#############

export PATH=$PATH:$HOME/.local/bin
pad="`xsetwacom --list devices | grep 'type: PAD' | \
  sed 's/.*id: \([0-9][0-9]*\).*/\1/'`"

#source ~/Programs/root-6.20.04/build/bin/thisroot.sh

###########
# ALIASES #
###########

# Text edit
alias plaspell="aspell -c -t --lang=pl"
alias pdflatex="pdflatex --interaction nonstopmode"
alias vimr="vim -R"
alias cc="xclip -selection clipboard"
alias vv="xclip -o -selection clipboard"
alias c="xclip"
alias v="xclip -o"
alias note="vim ~/Documents/Notes/QuickNote.md"

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
alias venv="source /tmp/venv/bin/activate"

# YT
alias yt_mp3="youtube-dl  --extract-audio --audio-format mp3 --audio-quality 0 -f bestaudio "
alias yt_mp4="youtube-dl  -f mp4 "

# Tmux
alias tmux_return="tmux attach-session"

#############
# Functions #
#############


function weather()
{
	chose=$1
	loc=$2
	if [ $1 = "-v2" ]
	then
		curl "wttr.in/$2?format=v2" 
	fi
	if [ $1 = "-v0" ]
	then
		curl "wttr.in/$2?0" 
	fi
	if [ $1 = "-v1" ]
	then
		curl "wttr.in/$2"
	fi	
}

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

function bgr()
{
	nohup `$@` &>/dev/null &
}

function pip-upload()
{

	python setup.py sdist
	twine upload dist/*

	echo "Deleting dist/ ..."
	rm -rf dist *.egg-info
}

function markdown-gen()
{
	if [ $1 = "-h" ] 
	then
		echo "markdown-gen <name> <version>"
		echo "optional -k: stop after deleting files"
	else
		deactivate
		virtualenv sphinx-venv
		source sphinx-venv/bin/activate
		pip install sphinx
		pip install sphinx-markdown-builder
		pip install -r requirements.txt
		python setup.py install
		sphinx-apidoc -o _docs . sphinx-apidoc --full -A 'Albert Szadziński' -H $1 -V $2
		cd _docs
echo "
import os
import sys
sys.path.insert(0,os.path.abspath('../'))
def skip(app, what, name, obj,would_skip, options):
    if name in ( '__init__',): return False
    return would_skip
def setup(app): app.connect('autodoc-skip-member', skip)
" >> conf.py;
		make markdown
		cd ..
		if [ $3 = "-k" ]
		then
			echo "paused..."
		else
			deactivate
			mv _docs/_build/markdown docs
			rm -rf _docs sphinx-venv
			echo "Done"
		fi

	fi
}

eval $(thefuck --alias)
