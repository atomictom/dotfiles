#! /bin/bash

# Thomas Manning's bashrc file!

source "$HOME/.bashrc.private"

stty -ixon
shopt -s histappend

# Set globalish variables
FIRST_SCREEN=~thomas/.main_screen

export PATH="$HOME/.bin/tmp:$PATH"
export TERM='xterm-256color'

# Set the prompt
if [[ ${EUID} == 0 ]] ; then
	PS1='\[\033[0;31m\]$(returncode)\[\033[0;37m\]\[\033[0;35m\]${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
	PS1='\[\033[0;31m\]$(returncode)\[\033[0;37m\]\[\033[0;35m\]${debian_chroot:+($debian_chroot)}\[\033[0;35m\]\u@\h\[\033[0;37m\]:\[\033[0;36m\]\w >\[\033[0;00m\] '
fi

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
alias silly-mp3="youtube-dl --extract-audio --audio-format=mp3 -o ~/\"Music/Other/Silly/%(title)s.%(ext)s\""
alias ic="iced"
alias fbs="files-by-size"
alias sagusagu='sudo apt-get update && sudo apt-get upgrade'
alias idle='idle-python2.7 -s &'
alias xo='xdg-open'
alias o='xdg-open'
alias ..='cd ..'
alias b='cd -'
alias vb='vim ~/.bashrc'
alias vv='vim ~/.vimrc'
alias rv='unset DBUS_SESSION_BUS_ADDRESS SESSION_MANAGER'
alias zzz='sudo pm-suspend'
alias bright='sudo ~/.bin/bright'
alias bl='sudo ~/.bin/bright'
alias untar_all='for f in *; do tar xvfa $f; done'
alias k='klink &'
alias aps='apt-cache show'
alias x='xrandr'
alias c='xsel -b'
alias su='sudo su'

# Start cmus in a new window inside the bash screen instant
# if it is not already opened.
#if ! cmus-remote -C >/dev/null 2>&1 ; then
#	screen -S main -p music -X eval cmus
#	screen -S main -X 'select' shell
#fi

function files-by-size(){ find $1 -type f -print0 | xargs -0 du -sh |sort -hr; }
function files-by-size-x(){ find $1 -xdev -type f -print0 | xargs -0 du -sh |sort -hr; }
function copy(){ echo -n "$*" | xsel -b; }
function sf(){ echo -n $(pwd)/$1 | xsel -b; }
function sfw(){ echo -n "file://$(pwd)/$1" | xsel -b; }

function backup-caeli(){
	#echo >> ~/rsync_error_log
	#echo "-------------------- Backup on $(date) --------------------" >> ~/rsync_error_log
	#echo >> ~/rsync_error_log

	dry=''
	if [[ "$1" == "dry" ]]; then
		dry='-n'
	fi

	# max_delete='--max_delete=100'
	max_delete=''
	# if [[ "$2" == "delete" ]]; then
	# 	max_delete=''
	# fi


	for dir in Books Code Documents Games Music Other Pictures projects scratch Software Torrents Videos .icons .backups; do
		echo
		echo "-------------------- $dir --------------------"
		echo
		rsync -va --delete $max_delete $dry "/home/thomas/Data/$dir/" "/media/thomas/Caeli/$dir/" || echo "Error on $dir" >> ~/rsync_error_log;
	done
}

function returncode {
	returncode=$?
	if [ $returncode != 0 ]; then
		echo "[$returncode]"
	else
		echo ""
	fi
}

function fortune_cookie(){
	BOX_NAMES=( $(cat /etc/boxes/boxes-config
		     |grep -Poz 'BOX \K(.*)'| grep -v test) )
	BOX_COUNT=${#BOX_NAMES[@]}
	BOX_TO_USE=${BOX_NAMES[ (( $RANDOM % $BOX_COUNT )) ]}
	fortune |boxes -d $BOX_TO_USE
	#echo $BOX_TO_USE
}
