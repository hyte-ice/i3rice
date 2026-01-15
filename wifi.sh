#!/bin/bash

ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes:' | cut -d: -f2)

if [[ -z "$ssid" ]]; then
    echo "WiFi: disconnected"
else
    echo "WiFi: $ssid"
fi
