if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi &

setxkbmap -layout dvp,ru -variant -option grp:caps_toggle,grp_led:caps,terminate:ctrl_alt_bksp
xmodmap ~/.Xmodmap

source ~/login_general.sh
source ~/shell_general.sh

N=$((15 * 60))
X=-2
CMD="bgtext.sh"
changefile="$HOME/Pictures/wallpapers/change"
while true; do
    if [ $X -eq 0 ]
    then
        eval $CMD
    elif [ -e $changefile ]
    then
        eval $CMD
        rm $changefile
    fi
    X=$((($X + 1) % $N))
#   xsetroot -name "`acpi` | `date`"
    sleep 1 #1m
done &

xrdb -merge .Xresources

xscreensaver -no-splash &
conky &
$HOME/.dropbox-dist/dropboxd &
[[ -z "$(ps -C emacs --no-headers)" ]] && emacs --daemon &

export _JAVA_AWT_WM_NONREPARENTING=1
#wmname LG3D # for GUI java programs under lightweight window managers
# xterm
clfswm
