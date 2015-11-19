#! /bin/bash

# Thomas Manning's bashrc file!

# Personal Stuff {{{
source "$HOME/.bashrc.private"
source "/usr/local/bin/virtualenvwrapper.sh"
export GEM_HOME="$HOME/.gems"
export GEM_PATH="$HOME/.gems:$GEM_PATH"
export RB_USER_INSTALL='true'
export PATH="$HOME/.gems/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/.packages/racket/racket/bin:$PATH"
export PATH="$HOME/.bin/tmp:$PATH"
export PATH="$HOME/.bin:$PATH"
first_screen=~thomas/.first_screen
# }}}

# Settings {{{
stty -ixon
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; ${PROMPT_COMMAND}"
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;016m\E[48;5;220m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
# }}}

# Looks {{{
export TERM='xterm-256color'

# Customize the ls colors
eval `dircolors ~/.dircolors`

# Set the prompt
set_prompt_vars(){
    ret=$?

    # Forground Colors
    black="\[$(tput setaf 0)\]"
    red="\[$(tput setaf 1)\]"
    green="\[$(tput setaf 2)\]"
    yellow="\[$(tput setaf 3)\]"
    blue="\[$(tput setaf 4)\]"
    magenta="\[$(tput setaf 5)\]"
    cyan="\[$(tput setaf 6)\]"
    white="\[$(tput setaf 7)\]"

    # Attributes
    bold="\[$(tput bold)\]"
    dim="\[$(tput sgr0)\]"

    # Exit will set the return code for $(returncode) to read
    # Without this, returncode will return the status of the line before it
    $(exit $ret)
    local return_code="$dim$red"$(returncode)
    if [ -z "$VIRTUAL_ENV" ]; then
        local virtualenv_name=""
    else
        local virtualenv_name="$bold$green($(basename "$VIRTUAL_ENV"))"
    fi
    if git rev-parse --git-dir >/dev/null 2>&1; then
        if ! git diff-index --quiet --cached HEAD 2>/dev/null || ! git diff-files --quiet; then
            local git_branch_color="$dim$red"
        elif git ls-files --other --exclude-standard --error-unmatch . >/dev/null 2>&1; then
            local git_branch_color="$dim$yellow"
        else
            local git_branch_color="$dim$green"
        fi
    fi
    local git_branch="$git_branch_color"$(__git_ps1|tr -d " ")
    local chroot="$dim$magenta"${debian_chroot:+($debian_chroot)}
    if [[ ${EUID} == 0 ]] ; then # If root
        local username_host_dir="$bold$red\h$bold$blue \W"
        local prompt="$dim$cyan\$ "
    else
        local username_host_dir="$dim$magenta\u@\h$dim$white:$dim$cyan\w"
        local prompt="$dim$cyan> "
    fi
    local unmodify_color='\[\033[0;00m\]'
    local screen_hack='\[\033k\033\\\]'
    local end_prompt=$unmodify_color$screen_hack

    export PS1="$return_code$virtualenv_name$chroot$username_host_dir$git_branch $prompt$end_prompt"
    return $ret
}
export PROMPT_COMMAND="set_prompt_vars"
# }}}

# Autorun Inside Screen {{{
if [ ! -e "$first_screen" ]; then
	if [ -e "$HOME/.screenrc" ]; then
		first_screen="$HOME/.screenrc"
	else
		first_screen="/dev/null"
	fi
fi

# If this session is interactive
case $- in
	# If we are not running inside screen
	*i*)	if [ -z "$STY" ]; then
			# Start screen or connect to an existing session
			screen '-xR' -S main -T linux -c $first_screen
                else
                        export TERM='xterm-256color'
		fi
		;;
esac
# }}}

# Aliases {{{
alias lla='ls -la'
alias ll='ls -l'
alias la='ls -a'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias ls='ls -h --color=auto'
alias sr='screen -r'
alias sx='screen -x'
alias cr='cmus-remote'
alias crq='cmus-remote -Q'
alias mp='cmus-remote -C player-play'
alias next='cmus-remote -C "player-next"'
alias cux='chmod u+x'
alias less='less -r'
alias fbs="files-by-size"
alias a='sudo apt-get '
alias sag='sudo apt-get '
alias u='sudo apt-get update '
alias apt='sudo apt-get '
alias sagu='sudo apt-get update '
alias i='sudo apt-get install '
alias sagi='sudo apt-get install '
alias acs='apt-cache show '
alias s='apt-cache show '
alias idle='idle-python2.7 -s &'
alias xo='xdg-open'
alias o='xdg-open 2>/dev/null '
alias ..='cd ..'
alias b='cd -'
alias vb='vim ~/.bashrc'
alias vpriv='vim ~/.bashrc.private'
alias vs='vim ~/.ssh/config'
alias vc='vim ~/.calcrc'
alias vp='vim ~/.profile'
alias vv='vim ~/.vimrc'
alias rv='unset DBUS_SESSION_BUS_ADDRESS SESSION_MANAGER'
alias untar_all='for f in *; do tar xvfa $f; done'
alias aps='apt-cache show '
alias show='apt-cache show '
alias x='xrandr'
alias c='xsel -b'
alias su='sudo su'
alias untar='tar xvfa'
alias gs='git status'
alias gl='git log'
alias gr='git reflog'
alias gd='git diff'
alias gf='git fetch'
alias gbv='git branch -v'
alias hrd='history -r'
alias hw='history -w'
alias info='info --vi-keys'
# }}}

# Personal Aliases {{{
# Aliases that are specific to my system either because of relying on a particular directory or command
alias youtube-mp3="youtube-dl --extract-audio --audio-format=mp3 -o ~/\"Music/organized/Youtube/%(title)s.%(ext)s\""
alias mproxy='~/.bin/make-proxy &> /dev/null &'
alias silly-mp3="youtube-dl --extract-audio --audio-format=mp3 -o ~/\"Music/other/Silly/%(title)s.%(ext)s\""
alias ic="iced"
alias zzz='sudo pm-suspend'
alias bright='sudo ~/.bin/bright'
alias bl='sudo ~/.bin/bright'
alias uu='sudo ~/.bin/uu'
alias k='klink &'
alias rrl='rm Downloads/rtorrent/.session/rtorrent.lock'
# I made a python utility that does a better job
# alias dff="df -h | grep -P '(Avail|/Data|/home|/$)' | sort -hk 4"
# }}}

# Functions {{{
function files-by-size(){ find $1 -type f -print0 | xargs -0 du -sh |sort -hr; }
function files-by-size-x(){ find $1 -xdev -type f -print0 | xargs -0 du -sh |sort -hr; }
function copy(){ echo -n "$*" | xsel -b; }
# Select File (copy path to a file to the clipboard)
function sf(){ echo -n $(pwd)/$1 | xsel -b; }
function sfw(){ echo -n "file://$(pwd)/$1" | xsel -b; }
function yy(){ yes "$@" | eval "$( history 2 | head -n1 | sed -e 's/^\s*[0-9]*\s*//')" ; echo ;}

function capitalize(){
	for i in *; do
		mv "$i" "$(echo "${i,,}" | sed -e 's/\(-\|\s\)\(\w\)/\1\U\2/g')"
	done
}

function hr(){
	for i in $(seq $1); do
		echo -n '-'
	done
	echo
}

function list-ips(){
	ifconfig | grep -Pzo '(wlan|eth).*\n.*inet\s.*?\s' | sed "N; s/\s*Link.*\n\s*/'s /; s/inet addr:/ip address is: /";
}

function pyserv(){
	echo
	list-ips
	hr 40
	echo
	python -m SimpleHTTPServer
}

function search-files-from(){
	dir=""
	if [ -d "$1" ]; then
		dir="$1"
		shift 1
	else
		echo "The first argument should be a valid directory"
		exit 2
	fi

	find "$dir" -type f -print0 | while read -d $'\0' f; do
		grep "$@" "$f"
	done
}

function search-files(){
	find -type f -print0 | while read -d $'\0' f; do
		grep "$@" "$f"
	done
}

function search-files-x(){
	find -xdev -type f -print0 | while read -d $'\0' f; do
		grep "$@" "$f"
	done
}

function _gen-passwd(){
	if [ -z "$2" ]; then
		length=20
	else
		length="$2"
	fi

	# tr -dc "$1" < /dev/urandom | fold -w "$length" | head -n 1 | tee >(xsel -b)
	tr -dc "$1" < /dev/urandom | head -c "$length" | tee >(xsel -b)
}

function gen-passwd-alnum(){
	_gen-passwd '[:alnum:]' "$1"
}

function gen-passwd(){
	_gen-passwd '[:graph:]' "$1"
}

function returncode {
	returncode=$?
	if [ $returncode != 0 ]; then
		echo "[$returncode]"
	else
		echo ""
	fi
}

function fortune-cookie(){
	BOX_NAMES=( $(cat /etc/boxes/boxes-config | grep -Poz 'BOX \K(.*)'| grep -v test) )
	BOX_COUNT=${#BOX_NAMES[@]}
	BOX_TO_USE=${BOX_NAMES[ (( $RANDOM % $BOX_COUNT )) ]}
	fortune |boxes -d $BOX_TO_USE
	#echo $BOX_TO_USE
}
# }}}

# Personal Functions {{{
function backup-caeli(){
	# Locations
	error_file="$HOME/rsync_error_log"
	data_dir="$HOME/Data"
	caeli_dir='/media/Caeli'
	backup_dirs='Books Code Documents Games Music Other Pictures projects scratch Software Torrents Videos .icons .backups'

	# Default options
	dry=''
	max_delete='--max-delete=100'

	# Print error log header
	echo >> "$error_file"
	echo "-------------------- Backup on $(date) --------------------" >> "$error_file"
	echo >> "$error_file"

	# Parse options
	while [ $# -gt 0 ]; do
		case "$1" in
			"dry")
				dry='-n'
				;;
			"delete")
				max_delete=''
				;;
			*)
				echo unrecognized argument: $1
				;;
		esac
		shift 1
	done

	# Backup each directory
	for dir in $backup_dirs; do
		echo
		echo "-------------------- $dir --------------------"
		echo
		rsync -vaH --delete $max_delete $dry "$data_dir/$dir/" "$caeli_dir/$dir/" || echo "Error on $dir" >> "$error_file";
	done

	# Delete the error file if it only contains the header
	if [ $(wc -l "$error_file" | cut -d ' ' -f 1) -eq 3 ]; then
		rm -f "$error_file";
		echo "Done! Removed error file because there were no errors."
	else
		echo "Process has completed, however there are errors logged in $error_file"
	fi
}
# }}}
