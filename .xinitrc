if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi &

setxkbmap -layout us,ru -variant -option grp:caps_toggle,grp_led:caps,terminate:ctrl_alt_bksp &

N=$((15 * 60))
X=-2
CMD="awsetbg -u hsetroot -F -R $HOME/wallpapers/"
changefile="$HOME/wallpapers/change"
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
    sleep 1 #1m
done &

xrdb -merge .Xresources &

VBoxClient-all &
xscreensaver -no-splash &
emacs --daemon &

#wmname LG3D # for GUI java programs under lightweight window managers

#exec stumpwm
exec dswm
#exec awesome
#exec xterm
