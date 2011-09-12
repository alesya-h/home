[[ -n $SHELL_GENERAL_LOADED ]] && return
export SHELL_GENERAL_LOADED=true

export EDITOR="emacsclient"
export ALTERNATE_EDITOR="emacs"
export BROWSER=firefox
export CLICOLOR=1
alias pacman='sudo pacman'
alias ec='emacsclient -n'
alias be='bundle exec'

[[ "$TERM" == "xterm" ]] && export TERM="xterm-256color"

alias ls='ls --color=auto'
alias l='ls -la'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias du1='du -d 1 -h'
alias du2='du -d 2 -h'
alias du3='du -d 3 -h'

alias f='find | grep'
alias gg='git grep'

export PATH="$PATH:$HOME/p/my/scripts:$HOME/bin"
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
