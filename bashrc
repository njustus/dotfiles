#!/bin/bash
# set history length
HISTSIZE=1000
HISTFILESIZE=2000

#append to histfile; not overwrite
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


export EDITOR=vim #default editor

# activate keyring capabilities
#source ~/.i3/start-gnome-keyring.sh


function git_info() {
  local branch=$(git rev-parse --abbrev-ref HEAD 2>> /dev/null)
  local status=$(git status -s 2>> /dev/null)
  if [ $branch ]; then
    echo -n "("$branch #git branch name

    #git status indicator; indicates nothing if working directory is clean
    if [[ $status =~ ^.M ]] #modified files
      then echo -n " - ✬"
    elif [[ $status =~ ^\? ]] #new/unknown files
      then echo -n " - ?"
    elif [[ $status =~ ^.D ]] #deleted files
      then echo -n " - ✗"
    fi
    echo -n ")"
  fi
}

#setup lookup for system type
system=$(uname -s)
function isMac() {
  case $system in
    "Darwin") echo true ;;
    *) echo false ;;
  esac
}
function isLinux() {
  case $system in
    "Linux") echo true ;;
    *) echo false ;;
  esac
}
function path() {
  echo $(pwd)/$1
}
function pless() {
  pygmentize $1 | less -R
}
export -f isMac
export -f isLinux
export -f path
export -f pless

source ~/.env_variables

if [ $(isLinux) == true ]
  then
    export TERM=xterm-256color #true 256 color terminal
fi

source ~/.bash_aliases

# custom promp
export PS1='┌ \[\e[1;33m\]\u\[\e[m\]@\[\e[0;34m\]\h\[\e[m\] - \[\e[1;36m\]\W\[\e[m\] \[\e[33m\]$(git_info)\n\[\e[m\]└\[\e[1;31m\] ?\[\e[m\] '

source ~/.system_config

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
