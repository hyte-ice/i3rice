#!/bin/bash
# Show brightness percentage using brightnessctl

current=$(brightnessctl get)
max=$(brightnessctl max)

if [[ -n "$current" && -n "$max" && "$max" -ne 0 ]]; then
    percent=$(( 100 * current / max ))
    echo "Brightness: $percent%"
else
    echo "Brightness: N/A"
fi
