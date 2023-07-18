#!/bin/bash

VPN_NAME="$1"

VPN_STATUS=$(nmcli con show --active | grep "${VPN_NAME}")

if [ -z "${VPN_STATUS}" ]; then
	echo "VPN is disconnected, connecting now..."
	nmcli con up id "${VPN_NAME}"
else
	echo "VPN is connected, disconnecting now..."
	nmcli con down id "${VPN_NAME}"
fi
