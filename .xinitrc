#!/usr/bin/env bash

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi &

# sxiv for images
xrdb -merge .Xresources
setxkbmap -layout dvorak,ru -variant -option grp:menu_toggle,grp_led:caps,terminate:ctrl_alt_bksp
xset r rate 200 50
xmodmap ~/.Xmodmap

dispwin -d 1 -I /usr/share/color/icc/TPLCD95.icm
TOTAL_SCREENS=`xrandr|grep connected|wc -l`
if [ $TOTAL_SCREENS -gt 1 ]; then
  LAPTOP_SCREEN="$(xrandr|grep connected|awk -e '{print $1}'|grep LVDS)"
  VGA_SCREEN="$(xrandr|grep connected|awk -e '{print $1}'|grep VGA)"
  xrandr --output "$LAPTOP_SCREEN" --left-of "$VGA_SCREEN"
	xrandr --output "$LAPTOP_SCREEN" --auto
	xrandr --output "$VGA_SCREEN" --auto
  dispwin -d 1 -I /usr/share/color/icc/TPLCD95.icm
  dispwin -d 2 -I /usr/share/color/icc/Argyll/sRGB.icm
fi

# xcalib -s 0 $HOME/TPLCD95.icm
source ~/login_general.sh
source ~/shell_general.sh

# while true; do
#     chwp
#     sleep 10m #1m
# done &

xscreensaver -no-splash &
# conky &
$HOME/.dropbox-dist/dropboxd &
# [[ -z "$(ps -C emacs --no-headers)" ]] && emacs --daemon &

export _JAVA_AWT_WM_NONREPARENTING=1
play -q "$HOME/Dropbox/smb/smb_1-up.wav" &
#wmname LG3D # for GUI java programs under lightweight window managers
xcompmgr&
xbindkeys
# xterm
clfswm-loop
# startxfce4
