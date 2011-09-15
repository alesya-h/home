[[ -n $LOGIN_GENERAL_LOADED ]] && return
export LOGIN_GENERAL_LOADED=true

export EDITOR="emacsclient"
export ALTERNATE_EDITOR="emacs"
export BROWSER=firefox
export CLICOLOR=1

export PATH="$PATH:$HOME/p/my/scripts:$HOME/bin"
