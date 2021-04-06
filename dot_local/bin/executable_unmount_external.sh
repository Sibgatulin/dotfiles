#/bin/bash
# follow this https://askubuntu.com/questions/214646/how-to-configure-the-default-automount-location/276670#276670 to configure the automount location
VENDOR=$1
ID=$(lsblk -S | awk -v vendor=$VENDOR '$4 == vendor  {print $1}')
BLOCK=$(echo /dev/${ID}1)
udisksctl unmount -b $BLOCK
udisksctl power-off -b $BLOCK
