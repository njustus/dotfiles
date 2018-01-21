# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
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
function serve() {
  if [ "$1" != "" ]
  then
    python3 -m http.server $1
  else
    python3 -m http.server
  fi
}

#aliases
if [ $(isMac) = true ]
then
    alias ls='ls -G'
    alias afk='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

    #extension alias
    alias -s html='open -a opera'
    alias -s pdf='open -a preview'
    alias -s png='open -a preview'
    alias -s jpeg='open -a preview'
    alias emacs='open -a Emacs'
    alias work='zsh ~/dotfiles/scripts/setup-work.sh'
else
    alias ls='ls --color=auto'
    alias sdown='sudo shutdown -h now'
    alias reboot='sudo reboot'
    alias sbt='TERM=xterm sbt'
    alias scala='TERM=xterm scala'
    alias -s html='opera'
    alias -s pdf='evince'
    alias -s png='eog'
    alias -s jpeg='eog'
    alias -s jpg='eog'
fi

alias g=git
alias grep='grep --color=auto'

alias ll='ls -ahlF'
alias lsd='ls -d */' #list directories only
alias path="echo $PATH | tr ':' '\n'"
alias pls="sudo !!"

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "%F{136}(%F{cyan}%b%F{136})"

precmd () { vcs_info }
setopt prompt_subst


if [ $(isLinux) = true ]
then
    [[ -f /etc/profile.d/vte.sh ]] && . /etc/profile.d/vte.sh
fi

source ~/.env_variables

if [ "$TERM" = 'dumb' ]
then
  export PROMPT='> '
else
export PROMPT='┌ %F{042}%n %fat %F{039}%m %fin %B%F{163}%c %f%b
└ %B%F{160}λ.%f%b '

export RPROMPT='$vcs_info_msg_0_'
fi

source ~/.zsh-highlighting.zsh
