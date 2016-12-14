# this file is not supposed to be loaded more than once
if [ -n "$ZPROFILE_LOADED" ]; then
  playnote # for debug reasons
  return
fi
export ZPROFILE_LOADED=true

function source-if-exist { [ -e "$1" ] && source "$1" }

export NO_AT_BRIDGE=1
export GTK_IM_MODULE=xim
export QT_IM_MODULE=xim

export EDITOR="vim"
export VISUAL="vim"
export GIT_EDITOR="vim"
export BETTER_ERRORS_URL="emacs://%{file}:%{line}"
export BROWSER="firefox"
export CLICOLOR=1
export LESS="RS"
export PAGER="most"
export AUDIODRIVER="pulseaudio"
export FLASH_ALSA_DEVICE="plug:dmix"
export ABSROOT=/home/me/p/fork/abs
export PGUSER=postgres
#export RUBYGEMS_GEMDEPS=-

export NPM_PACKAGES="$HOME/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export GOPATH="$HOME/.go"
export SWIFTENV_ROOT="$HOME/.swiftenv"
eval `luarocks path`
export CHROME_BIN=chromium
export RUBY_CONFIGURE_OPTS="--enable-shared"
export BOOT_JVM_OPTIONS='-client -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xverify:none'
export BOOT_EMIT_TARGET=no

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
if which ruby >/dev/null && which gem >/dev/null; then
  export PATH="$(ruby -e 'puts Gem.user_dir')/bin:$PATH"
fi
eval "$($HOME/.rakudobrew/bin/rakudobrew init -)"
export PATH="$NPM_PACKAGES/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$SWIFTENV_ROOT/bin:$PATH"
eval "$(swiftenv init -)"
export PATH="$HOME/p/fork/camlistore/bin:$PATH"
export PATH="$HOME/p/fork/ruby-build/bin:$PATH"
export PATH="$HOME/p/fork/git-extras/bin:$PATH"


export MANPATH="$HOME/p/fork/git-extras/man:$MANPATH"
export MANPATH="$NPM_PACKAGES/share/man:$MANPATH"

# start ssh-agent and export its credentials
eval `ssh-agent`

source-if-exist "$HOME/.nix-profile/etc/profile.d/nix.sh"
source-if-exist "$HOME/.zprofile.$(hostname -s)"
