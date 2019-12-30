# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.bin" ] ; then
    PATH="$HOME/.bin:$PATH"
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

export STEAM_FRAME_FORCE_CLOSE=1

# Disable some keys (to save my pinkies).
# I obtained the keycode with `xev -event keyboard`
xmodmap -e 'keycode 62='  # Shift_R
# xmodmap -e 'keycode 37='  # Control_L
xmodmap -e 'keycode 105=' # Control_R
# Undo the overrides with `setxkbmap`
