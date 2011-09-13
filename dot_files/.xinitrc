# DBUS
if test -z "$DBUS_SESSION_BUS_ADDRESS" ; then
   eval `dbus-launch --sh-syntax --exit-with-session`
fi


#X
setxkbmap hr &
nitrogen --restore &
i3status | while read -r; do xsetroot -name "$REPLY"; done &

#Start DWM
exec dwm



