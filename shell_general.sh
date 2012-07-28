[[ "$TERM" == "xterm" ]] && export TERM="xterm-256color"
[ -n "$TMUX" ] && export TERM=screen-256color
[ -n "$TMUX" ] && export PATH="$HOME/.rbenv/bin:$PATH:$HOME/p/my/scripts:$HOME/p/my/fork/ruby-build/bin:$HOME/bin:$HOME/.local/bin"

alias pacman='sudo pacman'
alias ec='emacsclient -n'
alias be='bundle exec'

alias ls='ls --color=auto'
alias l='ls -la'
alias sys='sudo systemctl'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias du1='du -d 1 -h|sort -h'
alias du2='du -d 2 -h|sort -h'
alias du3='du -d 3 -h|sort -h'

alias f='find | grep'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias ..6='cd ../../../../../..'
alias ..7='cd ../../../../../../..'
alias ..8='cd ../../../../../../../..'
alias ..9='cd ../../../../../../../../..'
alias gg='git grep'

eval "$(rbenv init -)"
