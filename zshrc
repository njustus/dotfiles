# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch prompt_subst
unsetopt beep notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nico/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export EDITOR=vim #default editor

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

#aliases
if [ $(isMac) = true ]
then
    alias ls='ls -G'
    alias lockscr='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

    #extension alias
    alias -s html='open -a opera'
    alias -s pdf='open -a preview'
else
    alias ls='ls --color=auto'
    alias sdown='sudo shutdown -h now'
    alias reboot='sudo reboot'
fi

alias g=git
alias grep='grep --color=auto'

alias ll='ls -ahlF'
alias lsd='ls -d */' #list directories only

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats "(%F{blue}%s%f:%F{yellow}%b%f)"
zstyle ':vcs_info:git*' formats "(%F{cyan}%s%f:%F{yellow}%b%f)"

precmd () { vcs_info }
setopt prompt_subst

export PROMPT='┌ %F{041}%n %fat %F{039}%m %fin %B%F{163}%c %f%b
└ %B%F{160}λ.%f%b '

export RPROMPT='%F{136}$vcs_info_msg_0_'
