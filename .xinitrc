#!/bin/zsh --login

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi &
HOST_ONLY="$HOME/.xinitrc.$(hostname -s)"

# sxiv for images
xrdb -merge .Xresources
setxkbmap -layout us,ru -variant dvorak, -option grp:menu_toggle,grp_led:caps,terminate:ctrl_alt_bksp,caps:hyper
xset r rate 200 50
xmodmap ~/.Xmodmap

# Minsk coordinates used
# xflux -l 53.900184 -g 27.566586 -r 1

xscreensaver -no-splash &
$HOME/.dropbox-dist/dropboxd &

export _JAVA_AWT_WM_NONREPARENTING=1
transparency &
xbindkeys
dunst&

if [ -e "${HOST_ONLY}" ]; then
    source "${HOST_ONLY}"
fi

chwp

"${1-"awesome"}"
