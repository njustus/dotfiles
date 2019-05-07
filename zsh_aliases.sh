#setup lookup for system type
system=$(uname -s)
function isMac() {
    case $system in
        "Darwin") echo true ;;
        *) echo false ;;
    esac
}

#aliases
if [ $(isMac) = true ]
then
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

alias mkube='kubectl -n=microservices'
alias dcl='docker container ls'
alias dcst='docker container stop'
alias dil='docker image ls'
