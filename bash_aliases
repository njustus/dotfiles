#!/bin/bash
#contains aliases for bash


if [ $(isMac) == true ]
then
    alias ls='ls -G'
    alias lockscr='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
else
    alias ls='ls --color=auto'
    alias sdown='sudo shutdown -h now'
    alias reboot='sudo reboot'
fi

alias g=git
alias grep='grep --color=auto'

alias ll='ls -ahlF'
alias lsd='ls -d */' #list directories only
