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

add_resolution() {
  OUTPUT=$1
  W=$2
  H=$3
  MODELINE=$(cvt "$W" "$H" | tail -1 | sed -E 's/^([^ ]+ +){2}//')
  MODENAME="${W}x${H}"
  eval "xrandr --newmode $MODENAME $MODELINE"
  echo ------------------------
  xrandr --addmode "$OUTPUT" "$MODENAME"
}

dispwin -d 1 -I /usr/share/color/icc/TPLCD95.icm
TOTAL_SCREENS=`xrandr|grep ' connected'|wc -l`
if [ $TOTAL_SCREENS -gt 1 ]; then
  export LAPTOP_SCREEN="$(xrandr|grep connected|awk -e '{print $1}'|grep LVDS)"
  export VGA_SCREEN="$(xrandr|grep connected|awk -e '{print $1}'|grep VGA)"
  xrandr --output "$LAPTOP_SCREEN" --auto
  xrandr --output "$VGA_SCREEN" --auto
  # xrandr --output "$VGA_SCREEN" --mode 800x600
  xrandr --output "$VGA_SCREEN" --right-of "$LAPTOP_SCREEN"
  dispwin -d 1 -I /usr/share/color/icc/TPLCD95.icm
  dispwin -d 2 -I /usr/share/color/icc/Argyll/sRGB.icm
else
  add_resolution LVDS1 1280 720
fi

screenlog start

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
