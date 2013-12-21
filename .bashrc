#! /bin/bash

# Thomas Manning's bashrc file!

stty -ixon
shopt -s histappend

# Set globalish variables
PATH=$PATH:/home/thomas/.bin
FIRST_SCREEN=~thomas/.main_screen
export TERM='xterm-256color'

# Customize the ls colors
eval `dircolors ~/.dircolors`
alias ls="ls --color=auto"

# If this session is interactive
case $- in
	# If we are not running inside screen
	*i*)	if [ -z "$STY" ]; then
			screen '-xR' -S main -T linux -c $FIRST_SCREEN
		fi
		;;
esac

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
#alias l='fc -s | less -r'
alias to_rc='fc -ln -2 | xargs >> ~/.bashrc'
alias sr='screen -r'
alias sx='screen -x'
alias cr='cmus-remote'
alias crq='cmus-remote -Q'
alias mp='cmus-remote -C player-play'
alias next='cmus-remote -C "player-next"'
alias sagi='sudo apt-get install'
alias cux='chmod u+x'
alias less='less -r'
alias uu='sudo apt-get update && sudo apt-get upgrade'
alias youtube-mp3="youtube-dl --extract-audio --audio-format=mp3 -o ~/\"Music/~Organized Music/Youtube/%(title)s.%(ext)s\""
alias ic=iced
alias fbs=files-by-size
alias sagusagu='sudo apt-get update && sudo apt-get upgrade'
alias idle='idle-python2.7 -s &'
alias xo='xdg-open'
alias o='xdg-open'

# Start cmus in a new window inside the bash screen instant
# if it is not already opened.
#if ! cmus-remote -C >/dev/null 2>&1 ; then
#	screen -S main -p music -X eval cmus
#	screen -S main -X 'select' shell
#fi

function mcf(){ ssh minecraftferret.no-ip.org -l $1; }
function lxz(){ ssh linuxzoo.net -l $1; }
function iced(){ ssh icedcoffee.no-ip.org -l $1; }
function files-by-size(){ find $1 -type f -print0 | xargs -0 du -sh |sort -hr; }

function fortune_cookie(){
	BOX_NAMES=( $(cat /etc/boxes/boxes-config
		     |grep -Poz 'BOX \K(.*)'| grep -v test) )
	BOX_COUNT=${#BOX_NAMES[@]}
	BOX_TO_USE=${BOX_NAMES[ (( $RANDOM % $BOX_COUNT )) ]}
	fortune |boxes -d $BOX_TO_USE
	#echo $BOX_TO_USE
}
