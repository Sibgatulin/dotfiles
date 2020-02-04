#!/bin/sh
FILENAME=/tmp/xrandr-init.sh
xrandr -q | grep -A1 -w connected | awk '
    BEGIN{printf "xrandr --output eDP-1-1 --primary --mode 1920x1080 \\\n"}
    /HDMI/ {matched=1; printf "--output %s ", $1; next}
    matched && /^   / {printf "--mode %s --right-of eDP-1-1 \n", $1}
' | tee $FILENAME && sh $FILENAME && rm $FILENAME && bspc wm -r
