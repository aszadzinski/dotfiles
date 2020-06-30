# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/pi/.oh-my-zsh"
  export LC_ALL=en_GB.utf8

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)
ZSH_THEME="frisk"

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


export EDITOR=vim

export PATH=$PATH:$HOME/.local/bin

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



# Net
alias myip="curl http://ipecho.net/plain; echo"

# VNC
alias vnc1="vncserver -geometry 768x1024 -dpi 150"
alias vnc2="vncserver -geometry 1280x720 -dpi 150"

# Package management

# Others
alias ..="cd .."
alias ...="cd ../.."
alias ls="ls -a --color=auto"

# YT

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
