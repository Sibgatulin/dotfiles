#!/bin/sh
DEVICE="1C:A0:D3:9B:03:D2"
bluetooth_print() {
    COLOR_ON=$(xrdb -query | grep foreground | cut -f 2)
    COLOR_OFF=$(xrdb -query | grep color8 | cut -f 2)
    TARGET_DEVICE="SoundBuds Flow"
    if [ "$(systemctl is-active "bluetooth.service")" = "active" ]; then
        echo -n "%{F$COLOR_ON} "

        devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)

        for device in $devices_paired; do
            device_info=$(bluetoothctl info "$device")
            device_alias=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)
            device_status=$(echo "$device_info" | grep "Connected" | cut -d ' ' -f 2-)

            if [ "$device_alias" = "$TARGET_DEVICE" ]; then
                [ "$device_status" = "yes" ] && echo -n  "%{F$COLOR_ON} "
                [ "$device_status" = "no" ] && echo  -n "%{F$COLOR_OFF} "
            fi
        done
    else
        echo -n "%{F$COLOR_OFF} "
    fi
}

bluetooth_toggle_soundbuds() {
    STATUS=$(bluetoothctl info "$DEVICE" | awk 'BEGIN{IFS=":"} /Connected/ {print $2}')
    if [ "$STATUS" = "no" ]; then
        bluetoothctl connect "$DEVICE"
    elif [ "$STATUS" = "yes" ]; then
        bluetoothctl disconnect "$DEVICE"
    fi
}

case "$1" in
    --toggle)
        bluetooth_toggle_soundbuds
        ;;
    *)
        bluetooth_print
        ;;
esac
