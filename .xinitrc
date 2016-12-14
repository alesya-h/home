#!/bin/zsh --login

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

slimlock &
# # -- Java hacks --
# wmname Sawfish
# export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
# export DESKTOP_SESSION=gnome
# # -- END: Java hacks --

xrdb -merge .Xresources
xset b off # disable keyboard beep
setinput
xbindkeys

#xflux -l 53.900184 -g 27.566586 -r 1 # Minsk coordinates used, r for randr

jack_control start
a2jmidid -e &
mpd
lxpanel &
pulseaudio --start
pasystray &
# xscreensaver -no-splash &
$HOME/.dropbox-dist/dropboxd &

compton --no-fading-openclose &
# lxqt-notificationd &
# dunst &
# datomic-dev-transactor &
# (sleep 10; exec camlistored -openbrowser=false) &
# cammount "$HOME/camlistore" &

function source-if-exist { [ -e "$1" ] && source "$1" }
source-if-exist "$HOME/.xinitrc.$(hostname)"

if xrandr --listproviders|grep nouveau; then
  xrandr --setprovideroutputsource nouveau Intel
fi
displays

i3

while true; do
  $(zenity --list --text "Select window manager" --column "command" i3 awesome openbox)
done
