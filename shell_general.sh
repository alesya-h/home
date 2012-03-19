[[ "$TERM" == "xterm" ]] && export TERM="xterm-256color"
[ -n "$TMUX" ] && export TERM=screen-256color

alias pacman='sudo pacman'
alias ec='emacsclient -n'
alias be='bundle exec'

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

notifications
eval "$(rbenv init -)"
