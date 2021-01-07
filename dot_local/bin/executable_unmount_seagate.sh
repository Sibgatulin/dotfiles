#/bin/bash
# follow this https://askubuntu.com/questions/214646/how-to-configure-the-default-automount-location/276670#276670 to configure the automount location

ID=$(lsblk -S | awk '/Seagate/ {print $1}')
BLOCK=$(echo /dev/${ID}1)
# MOUNTPOINT=$(lsblk $BLOCK | awk 'NR==2 {print $7}')
# echo $MOUNTPOINT
udisksctl unmount -b $BLOCK
udisksctl power-off -b $BLOCK
