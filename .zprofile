# this file is not supposed to be loaded more than once
if [ -n "$ZPROFILE_LOADED" ]; then
  playnote # for debug reasons
  return
fi
export ZPROFILE_LOADED=true

export NO_AT_BRIDGE=1

export EDITOR="vim"
export VISUAL="ec"
export BROWSER="firefox"
export CLICOLOR=1
export AUDIODRIVER="alsa"
export GREP_OPTIONS='--color=auto'
export ABSROOT=/home/me/p/fork/abs

export NPM_PACKAGES="$HOME/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$NPM_PACKAGES/bin:$PATH"
export PATH="$HOME/p/fork/ruby-build/bin:$PATH"
export PATH="$HOME/p/fork/git-extras/bin:$PATH"

export PATH="$HOME/narwhal/bin:$PATH"
export CAPP_BUILD="/home/me/CappBuild"

export MANPATH="$HOME/p/fork/git-extras/man:$MANPATH"
export MANPATH="$NPM_PACKAGES/share/man:$MANPATH"

HOST_ONLY="$HOME/.zprofile.$(hostname -s)"
[ -e "${HOST_ONLY}" ] && . "${HOST_ONLY}"
