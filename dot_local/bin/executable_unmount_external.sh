#/bin/bash
# follow this https://askubuntu.com/questions/214646/how-to-configure-the-default-automount-location/276670#276670 to configure the automount location
query_vendor() {
    VENDOR=$1
    ID=$(lsblk -S | awk -v vendor=$VENDOR '$4 == vendor  {print $1}')
    echo $ID
}
query_usb() {
    ID=$(lsblk -S | awk '$8 == "usb"  {print $1}')
    echo $ID
}
unmount_by_name() {
    ID=$1
    BLOCK="/dev/${ID}1"
    udisksctl unmount -b $BLOCK
    udisksctl power-off -b $BLOCK
}
unmount_vendor() {
    VENDOR=$1
    ID=$(query_vendor $VENDOR)
    unmount_by_name $ID
}
unmount_all() {
    for ID in $(query_usb); do
        unmount_by_name $ID
    done
}

case "$1" in
    --vend)
        unmount_vendor $2
        ;;
    --all)
        unmount_all
        ;;
esac
