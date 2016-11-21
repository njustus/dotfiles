#!/bin/bash
#contains aliases for bash


if [ $(isMac) == true ]
then
    alias ls='ls -G'
    alias lockscr='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
else
    alias ls='ls --color=auto'
fi

alias g=git
alias grep='grep --color=auto'

alias ll='ls -ahlF'
