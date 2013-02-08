# this file is not supposed to be loaded more than once
if [ -n "$ZPROFILE_LOADED" ]; then
  playnote # for debug reasons
  return
fi
export ZPROFILE_LOADED=true

export EDITOR="vim"
export BROWSER="firefox"
export CLICOLOR=1
export AUDIODRIVER="alsa"
export MYSERV="178.79.141.250"

export PATH="$HOME/.rbenv/bin:$PATH:$HOME/p/my/fork/ruby-build/bin:$HOME/p/my/fork/git-extras/bin:$HOME/bin:$HOME/.local/bin"
