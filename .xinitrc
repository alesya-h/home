#!/bin/zsh --login

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi &

# sxiv for images
xrdb -merge .Xresources
setxkbmap -layout us,ru -variant dvorak, -option grp:menu_toggle,grp_led:caps,terminate:ctrl_alt_bksp
xset r rate 200 50
xmodmap ~/.Xmodmap

add_resolution LVDS1 1280 720
dispwin -d 1 -I /usr/share/color/icc/TPLCD95.icm
TOTAL_SCREENS=`xrandr|grep ' connected'|wc -l`
if [ $TOTAL_SCREENS -gt 1 ]; then
    display-dual
fi

screenlog start -d 120

# chwp
pushd ~/Pictures/wallpapers/current
feh --bg-max lain2bgpl0.jpg lain_by_lga_d-d54qugf.jpg
popd

xscreensaver -no-splash &
# conky &
$HOME/.dropbox-dist/dropboxd &
# [[ -z "$(ps -C emacs --no-headers)" ]] && emacs --daemon &

export _JAVA_AWT_WM_NONREPARENTING=1
#wmname LG3D # for GUI java programs under lightweight window managers
xcompmgr&
xbindkeys
#xterm
exec clfswm-loop
# startxfce4
