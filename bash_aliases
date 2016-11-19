#!/bin/bash
#contains aliases for bash


if [ $(isMac) == true ]
then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi

alias g=git
alias grep='grep --color=auto'

alias ll='ls -ahlF'
