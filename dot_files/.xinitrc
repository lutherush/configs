setxkbmap hr &
nitrogen --restore &
i3status | while read -r; do xsetroot -name "$REPLY"; done &

#Start DWM
exec dwm



