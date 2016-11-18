# set history length
HISTSIZE=1000
HISTFILESIZE=2000

#append to histfile; not overwrite
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


export EDITOR=vim #default editor

source ~/.env_variables

if [ "$SYSTEM" == "linux" ]
  then export TERM=xterm-256color #true 256 color terminal
fi

source ~/.bash_aliases

# custom promp
export PS1="\[\e[0;36m\]\u\[\e[m\]@\[\e[0;36m\]\H\[\e[m\] - \[\e[37m\]\A\[\e[m\]\n\[\e[1;36m\]\W\[\e[1;31m\] \\$\[\e[0m\]  "

source ~/.system_config
