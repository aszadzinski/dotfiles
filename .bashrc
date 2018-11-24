#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
# >>> Added by cnchi installer
BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/vim

xset b off

alias plaspell="aspell -c -t --lang=pl"
alias exif="exiftool -all="
alias ..="cd .."
alias ...="cd ../.."
alias c="xclip"
alias v="xclip -o"

alias tor-opera="opera --proxy-server="socks://192.168.0.12:9100""

#xinput set-prop 11 283 1
