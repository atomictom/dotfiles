#! /bin/bash

# Thomas Manning's bashrc file!

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Settings {{{
stty -ixon
shopt -s histappend
shopt -s checkwinsize
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;016m\E[48;5;220m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Note: All of the below are specified in .profile instead to make bash startup
# faster: Disable some keys (to save my pinkies).
# I obtained the keycode with `xev -event keyboard`
# xmodmap -e 'keycode 62='  # Shift_R
# xmodmap -e 'keycode 37='  # Control_L
# xmodmap -e 'keycode 105=' # Control_R
# Undo the overrides with `setxkbmap`

# Source some helper scripts
if [[ -e "$HOME/.bashrc.private" ]]; then
    source "$HOME/.bashrc.private"
fi

if [[ -e "$HOME/.bashrc.setup" ]]; then
    source "$HOME/.bashrc.setup"
fi

if [[ -e "/usr/local/bin/virtualenvwrapper.sh" ]]; then
    source "/usr/local/bin/virtualenvwrapper.sh"
fi

# Personal variables
# This should be filled in by setup-vimruntime (from Vim source)
export VIMRUNTIME="/usr/share/vim/runtime"
export GEM_HOME="$HOME/.gems"
export GEM_PATH="$HOME/.gems:$GEM_PATH"
export RB_USER_INSTALL='true'
export GOPATH="$HOME/.golang/packages"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/.gems/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/.packages/racket/racket/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.bin/tmp:$PATH"
export PATH="$HOME/.bin:$PATH"
export EDITOR=vim
export IDLESTARTUP="$HOME/.idle.py"
export DISPLAY=:0.0
PROMPT_COMMAND=""
first_screen="$HOME/.first_screen"

# Google Cloud Stuff:
# The next line updates PATH for the Google Cloud SDK.
if [[ -e '/home/thomas/.packages/google-cloud-sdk/path.bash.inc' ]]; then
    source '/home/thomas/.packages/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [[ -e '/home/thomas/.packages/google-cloud-sdk/completion.bash.inc' ]]; then
    source '/home/thomas/.packages/google-cloud-sdk/completion.bash.inc'
fi

export PATH="$PATH:/home/thomas/.packages/google_appengine/"

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

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
# Force prompt to write history after every command with -a.
# Force prompt to read any new commands after every command with -n.
# http://superuser.com/questions/20900/bash-history-loss
function reload_history {
    history -a
    history -c
    history -r
}
if ! [[ "$PROMT_COMMAND" =~ "reload_history" ]]; then
    precmd_functions+=(reload_history)
    PROMPT_COMMAND="reload_history; $PROMPT_COMMAND"
fi
# }}}

# Looks {{{
# Customize the ls colors
eval `dircolors ~/.dircolors`

# Set the prompt
function wrap {
    prompt_path_wrap=$1
}
wrap 50

function promptstyle {
    prompt_ps1_style=$1
}
promptstyle 0

function screenautoname {
    screen_auto_name=$1
}
screenautoname 1

function toggleprompt {
    if [ "$prompt_ps1_style" -eq 1 ]; then
        prompt_ps1_style=0
    else
        prompt_ps1_style=1
    fi
}
alias tp='toggleprompt'

function toggleautoname {
    if [ "$screen_auto_name" -eq 1 ]; then
        screen_auto_name=0
    else
        screen_auto_name=1
    fi
}
alias ta='toggleautoname'

# Set the prompt
function generate_prompt {
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
    local unmodify_color='\[\033[0;00m\]'

    # Exit will set the return code for $(returncode) to read.  Without this,
    # returncode will return the status of the line before it
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
    if ! [[ -z "$git_branch" ]]; then
        local git_branch=" $git_branch"
    fi

    local datetime="$dim$cyan$(date +'[%H:%M:%S %d/%m/%y]')"

    local chroot="$dim$magenta"${debian_chroot:+($debian_chroot)}

    if [[ ${EUID} == 0 ]] ; then # If root
        local username_host="$bold$red\h"
        local dir="$bold$blue \W"
        local username_host_dir="$bold$red\h$bold$blue \W"
        local prompt="$dim$cyan\$ "
    else
        local username_host="$dim$magenta\u@\h"
        local dir="$bold$cyan\w"
        local username_host_dir="$dim$magenta\u@\h$dim$white:$dim$cyan\w"
        local prompt="$dim$cyan> "
    fi

    # Put screen hack to set the screen name to the program in if we're running
    # in screen and it's enabled
    if [[ -z "$STY" ]] || [[ "$screen_auto_name" -eq 0 ]]; then
        local screen_hack=''
    else
        local screen_hack='\[\033k\033\\\]'
    fi

    local end_prompt=$unmodify_color$screen_hack

    # Single line style (with wrapping).
    local prelude="$return_code$virtualenv_name$chroot$username_host_dir$git_branch"
    if expr \( length "$directory" \) \> $prompt_path_wrap > /dev/null 2>&1; then
        export PS1="$prelude \n-- $prompt$end_prompt"
    else
        export PS1="$prelude$prompt$end_prompt"
    fi

    # Two line style
    if [ "$prompt_ps1_style" -eq 1 ]; then
        local directory="$(pwd)"
        local directory="${directory/$HOME/\~}"
        local directory="$bold$cyan$directory"
        export PS1="$return_code$virtualenv_name$chroot$directory$git_branch$dim$white:$username_host\n$datetime $prompt$end_prompt"
    fi

    return $ret
}
if ! [[ "$PROMPT_COMMAND" =~ "generate_prompt;" ]]; then
    export PROMPT_COMMAND="generate_prompt; $PROMPT_COMMAND"
fi
# }}}

# Autorun Inside Screen {{{
if [ ! -e "$first_screen" ]; then
    if [ -e "$HOME/.screenrc" ]; then
        first_screen="$HOME/.screenrc"
    else
        first_screen="/dev/null"
    fi
fi

# If we are not running inside screen
if [ -z "$STY" ]; then
    export TERM='xterm-256color'
    # Start screen or connect to an existing session
    # screen '-xR' -S main -T linux -c $first_screen
else
    export TERM='screen-256color'
fi
# }}}

# Aliases {{{
alias irssi='TERM=screen-256color irssi'
alias weechat='TERM=screen-256color weechat'
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
alias a='sudo apt '
alias sag='sudo apt '
alias u='sudo apt update '
alias apt='sudo apt '
alias sagu='sudo apt update '
alias i='sudo apt install '
alias sagi='sudo apt install '
alias acs='apt-cache show '
alias s='apt-cache show '
alias idle='idle-python2.7 -s &'
alias xo='xdg-open'
alias o='xdg-open 2>/dev/null '
alias ..='cd ..'
alias b='cd -'
alias vb='vim ~/.bashrc'
alias vpriv='vim ~/.bashrc.private'
alias vpp='vim ~/.bashrc.private'
alias vbp='vim ~/.bashrc.private'
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
alias gd='git diff HEAD'
alias gds='git diff --staged'
alias gf='git fetch'
alias gbv='git branch -v'
alias hrd='history -r'
alias hw='history -w'
alias info='info --vi-keys'
alias bumpidle='kill -INT $(ps aux | grep '"'"'/usr/bin/i[d]le'"'"' | sed '"'"'s/thomas\s*\([0-9]*\).*/\1/'"'"')'
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
function files-by-size { find $1 -type f -print0 | xargs -0 du -sh |sort -hr; }
function files-by-size-x { find $1 -xdev -type f -print0 | xargs -0 du -sh |sort -hr; }
function copy { echo -n "$*" | xsel -b; }
# Select File (copy path to a file to the clipboard)
function sf { echo -n $(pwd)/$1 | xsel -b; }
function sfw { echo -n "file://$(pwd)/$1" | xsel -b; }
function yy { yes "$@" | eval "$( history 2 | head -n1 | sed -e 's/^\s*[0-9]*\s*//')" ; echo ;}

function capitalize {
    for i in *; do
        mv "$i" "$(echo "${i,,}" | sed -e 's/\(-\|\s\)\(\w\)/\1\U\2/g')"
    done
}

function hr {
    for i in $(seq $1); do
        echo -n '-'
    done
    echo
}

function list-ips {
    ifconfig | grep -Pzo '(wlan|eth).*\n.*inet\s.*?\s' | sed "N; s/\s*Link.*\n\s*/'s /; s/inet addr:/ip address is: /";
}

function pyserv {
    echo
    list-ips
    hr 40
    echo
    python -m SimpleHTTPServer
}

function search-files-from {
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

function search-files {
    find -type f -print0 | while read -d $'\0' f; do
        grep "$@" "$f"
    done
}

function search-files-x {
    find -xdev -type f -print0 | while read -d $'\0' f; do
        grep "$@" "$f"
    done
}

function _gen-passwd {
    if [ -z "$2" ]; then
        length=20
    else
        length="$2"
    fi

    tr -dc "$1" < /dev/urandom | head -c "$length" | tee >(xsel -b)
    echo
}

function gen-passwd-alnum {
    _gen-passwd '[:alnum:]' "$1"
}

function gen-passwd-pin {
    local pin=4
    if [ -n "$1" ]; then
        pin="$1"
    fi
    _gen-passwd '[:digit:]' "$pin"
}

function gen-passwd-sym {
    _gen-passwd '[:graph:]' "$1"
}

function write-random-data {
    set -x
    if [[ -z "$1" ]]; then
        echo "You must specify a destination, e.g. /dev/sdc" >2
        return 127
    fi

    local dest="$1"
    readonly pass="$(dd if=/dev/random bs=128 count=1 2>/dev/null | base64)"
    readonly blocksize="$(sudo blockdev --getsize64 ${dest})"
    sudo bash -c "openssl enc -aes-256-ctr -pass pass:${pass} -nosalt < /dev/zero | pv -pterb -s ${blocksize} >${dest}"
    set +x
    return 0
}

function returncode {
    returncode=$?
    if [ $returncode != 0 ]; then
        echo "[$returncode]"
    else
        echo ""
    fi
}

function regexkill {
    kill $(ps aux | grep -P $1 | awk '{print $2}')
}

function fortune-cookie {
    box_names=( $(cat /etc/boxes/boxes-config | grep -Poz 'BOX \K(.*)'| grep -v test) )
    box_count=${#box_names[@]}
    box_to_use=${box_names[ (( $RANDOM % $box_count )) ]}
    fortune | boxes -d $box_to_use
    #echo $box_to_use
}
# }}}
