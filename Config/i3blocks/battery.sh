nano#!/bin/bash 

# Show battery percentage  

capacity_path="/sys/class/power_supply/BAT1/capacity" 

status_path="/sys/class/power_supply/BAT1/status"  

if [[ -f "$capacity_path" ]]; then
     capacity=$(cat $capacity_path)
     status=$(cat $status_path)
     echo "Battery: $capacity% $status"
 else
     echo "Battery: N/A"
fi
