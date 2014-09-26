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
fastkb
xmodmap ~/.Xmodmap
if xinput | grep Trackball; then
  trackball
fi
# Minsk coordinates used
xflux -l 53.900184 -g 27.566586 -r 1

mpd
xscreensaver -no-splash &
$HOME/.dropbox-dist/dropboxd &

export _JAVA_AWT_WM_NONREPARENTING=1
wmname Sawfish
# export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
transparency &
xbindkeys
dunst&

if [ -e "${HOST_ONLY}" ]; then
    source "${HOST_ONLY}"
fi

chwp

"${1-"awesome"}"
openbox
