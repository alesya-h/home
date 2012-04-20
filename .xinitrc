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
xbindkeys

TOTAL_SCREENS=`xrandr|grep connected|wc -l`
if [ $TOTAL_SCREENS -gt 1 ]; then
	echo `xrandr|grep connected|awk -e '{print $1}'`|awk '{print "xrandr --output " $1 " --right-of " $2}' | sh
fi

# xcalib -s 0 $HOME/TPLCD95.icm
dispwin -d 1 -I /usr/share/color/icc/TPLCD95.icm
dispwin -d 2 -I /usr/share/color/icc/Argyll/sRGB.icm
source ~/login_general.sh
source ~/shell_general.sh

while true; do
    chwp
    sleep 10m #1m
done &

xscreensaver -no-splash &
# conky &
$HOME/.dropbox-dist/dropboxd &
# [[ -z "$(ps -C emacs --no-headers)" ]] && emacs --daemon &

export _JAVA_AWT_WM_NONREPARENTING=1
#wmname LG3D # for GUI java programs under lightweight window managers
xcompmgr&
# xterm
clfswm
