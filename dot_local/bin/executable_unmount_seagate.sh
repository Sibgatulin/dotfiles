#/bin/bash

ID=$(lsblk -S | awk '/Seagate/ {print $1}')
BLOCK=$(echo /dev/${ID}1)
# MOUNTPOINT=$(lsblk $BLOCK | awk 'NR==2 {print $7}')
# echo $MOUNTPOINT
udisksctl unmount -b $BLOCK
udisksctl power-off -b $BLOCK
