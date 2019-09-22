# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_aliases_private ]; then
    . ~/.bash_aliases_private
fi


# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    . /usr/local/bin/virtualenvwrapper.sh
fi

export TERM=xterm-256color

function j(){
    jobs | wc -l | egrep -v ^0 | sed -r 's/^([0-9]+)/ (\1)/'
}

function virtual_env_name(){
    if [ ! -z "$VIRTUAL_ENV" ]
    then
	name=`basename $VIRTUAL_ENV`
        echo "($name) "
    fi
}

intty=$(tty)
intty=${intty:5}
intty=${intty:0:3}


PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs

__prompt_command() {
	local EXIT="$?" # This needs to be first
	PS1="$(virtual_env_name)"

	local RCol='\[\e[0m\]'

	local Red='\e[0;31m'
	local Gre='\e[0;32m'
	local Blu='\e[1;34m'

	PS1+="${Gre}\u@\h$(j)${RCol}: ${Red}\w${Blu}$(__git_ps1)"
	if [ $EXIT != 0 ]; then
		PS1+="$Red \342\234\226 (${EXIT})"
	else
		PS1+="$Gre \342\234\224"
	fi
	PS1+="$RCol\n> "
}

export MANPAGER=most

export EDITOR=vim
# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUPSTREAM=auto

export LD_LIBRARY_PATH=$HOME/.self/lib:$LD_LIBRARY_PATH
export PATH=$HOME/.self/bin:$HOME/.local/bin:$PATH
export TMPDIR=$HOME/.tmp

if [ -f ~/.bash_local ]; then
  . ~/.bashrc_local
fi

# so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon

# for Git typos, eg make `gits tatus` run `git status`
preexec_invoke_exec () {
    [ -n "$COMP_LINE" ] && return  # do nothing if completing
    [ "$BASH_COMMAND" = "$PROMPT_COMMAND" ] && return # don't cause a preexec for $PROMPT_COMMAND
    local this_command=`HISTTIMEFORMAT= history 1 | sed -e "s/^[ ]*[0-9]*[ ]*//"`;
    if [ ${#this_command} -gt 4 ]
    then
        if [[ "${this_command:0:5}" =~ ^git[a-z]\ $ ]]
        then
            this_command=`gitty $this_command`
            $this_command
        fi
    fi
}
trap 'preexec_invoke_exec' DEBUG

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export HISTFILESIZE=
export HISTSIZE=
