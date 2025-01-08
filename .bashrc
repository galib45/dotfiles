# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

PS1='\033[1;32m\u@\h\033[0m:\033[1;34m\w\033[1;33m\n\$ '
# reset the color after every command
trap 'echo -n "$(tput sgr0)"' DEBUG

alias ls='exa'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls -T'
alias ds='du -hd1 | sort -hr'
alias python='python3'
alias pip='python3 -m pip'
alias ipa='ip -br -c a'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

# Function to add a directory to PATH if it's not already present
add_to_path() {
    local dir="$1"
    
    # Check if the directory is already in PATH
    if [[ ":$PATH:" != *":$dir:"* ]]; then
        export PATH="$dir:$PATH"
    fi
}

include() {
    if [ -f "$1" ]; then
    	source "$1"
    fi
}

export EDITOR="$(which nvim)"
export VISUAL=$EDITOR

include ~/ghtoken
include ~/.thisrc

add_to_path ~/installed
