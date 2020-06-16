#!/bin/sh
SB="1C:A0:D3:9B:03:D2"
WH="38:18:4C:6D:87:7C"
query_status() {
    DEV_MAC=$1
    DEV_ID=$2
    device_status=$(bluetoothctl info "$DEV_MAC" | grep "Connected" | cut -d ' ' -f 2-)

    [ "$device_status" = "yes" ] && echo -n  "%{F$COLOR_ON} $DEV_ID" && return 0
    [ "$device_status" = "no" ] && return 1
}

bluetooth_print() {
    COLOR_ON=$(xrdb -query | grep foreground | cut -f 2)
    COLOR_OFF=$(xrdb -query | grep color8 | cut -f 2)
    if [ "$(systemctl is-active "bluetooth.service")" = "active" ]; then
        echo -n "%{F$COLOR_ON} "
        query_status $WH WH || query_status $SB SB || echo  -n "%{F$COLOR_OFF}   "
    else
        echo -n "%{F$COLOR_OFF} "
    fi
}

bluetooth_prep() {
    rfkill unblock bluetooth
    bluetoothctl agent on
    bluetoothctl default-agent
}
bluetooth_toggle() {
    DEVICE=$1
    STATUS=$(bluetoothctl info "$DEVICE" | awk 'BEGIN{IFS=":"} /Connected/ {print $2}')
    if [ "$STATUS" = "no" ]; then
        bluetoothctl connect "$DEVICE"
    elif [ "$STATUS" = "yes" ]; then
        bluetoothctl disconnect "$DEVICE"
    fi
}

case "$1" in
    --prep)
        bluetooth_prep
        ;;
    --toggle_sb)
        bluetooth_toggle $SB
        ;;
    --toggle_wh)
        bluetooth_toggle $WH
        ;;
    *)
        bluetooth_print
        ;;
esac
