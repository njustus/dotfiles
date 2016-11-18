#contains aliases for bash


if [ "$SYSTEM" == "osx" ]
then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi

alias grep='grep --color=auto'

alias ll='ls -ahlF'
