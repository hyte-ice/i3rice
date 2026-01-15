#!/bin/bash
# Show CPU temperature in Celsius, assumes /sys/class/thermal/thermal_zone0/temp exists

if [[ -f /sys/class/thermal/thermal_zone0/temp ]]; then
    temp_raw=$(cat /sys/class/thermal/thermal_zone0/temp)
    temp=$((temp_raw / 1000))
    echo "Temp: ${temp}C"
else
    echo "Temp: N/A"
fi
