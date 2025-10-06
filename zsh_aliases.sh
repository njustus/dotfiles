#setup lookup for system type
system=$(uname -s)
function isMac() {
    case $system in
        "Darwin") echo true ;;
        *) echo false ;;
    esac
}

function emf() {
  emacsclient -a '' -nc $@
}
function em() {
  emacsclient -a '' -t $@
}

# Define the function
function path() {
	local name=$1
	echo $PWD/$name
}

#aliases
if [ $(isMac) = true ]; then
    #extension alias
    alias -s html='open -a firefox'
    alias -s pdf='open -a preview'
    alias -s png='open -a preview'
    alias -s jpeg='open -a preview'
else
    alias -s html='firefox'
    alias -s pdf='evince'
    alias -s png='xdg-open'
    alias -s jpeg='xdg-open'
    alias -s jpg='xdg-open'

    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
    alias upgrade='sudo aptitude update && sudo aptitude safe-upgrade'
fi

if $(type zoxide &> /dev/null); then
  eval "$(zoxide init zsh)"
  alias cd=z
fi

if $(type fzf &> /dev/null); then
  source <(fzf --zsh)
fi

if $(type eza &> /dev/null); then
    alias ls="eza --icons";
    alias ll="eza -lh --icons";
    alias la="eza -ha --icons";
fi

alias store="sudo bash data/Docs/automation/store.sh"
alias timestamp="date +%s"

# sort json
alias jqs="jq -S . "

#strip blanks from clipboard
alias blanks="pbpaste | grep . | pbcopy"

# docker
alias d=docker
alias dcl='docker container ls'
alias dcst='docker container stop'
alias dil='docker image ls'
alias dce='docker container exec -it'
alias compose=docker-compose
alias comopse=docker-compose

# kubernetes
alias mkube='kubectl -n=microservices'
alias k=kubectl

source $DF/local_aliases.sh
