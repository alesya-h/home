[[ -n $LOGIN_GENERAL_LOADED ]] && return
export LOGIN_GENERAL_LOADED=true

export EDITOR="vim"
export VISUAL="emacsclient"
export ALTERNATE_EDITOR="emacs"
export BROWSER=firefox
export CLICOLOR=1

export PATH="$HOME/.rbenv/bin:$PATH:$HOME/p/my/scripts:$HOME/p/my/fork/ruby-build/bin:$HOME/bin:$HOME/.local/bin"
