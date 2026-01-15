#!/bin/bash
# Show microphone muted/unmuted status using pactl

source=$(pactl get-default-source)
if [[ -z "$source" ]]; then
    echo "Mic: N/A"
    exit 0
fi

mute=$(pactl get-source-mute "$source" | awk '{print $2}')
if [[ "$mute" == "yes" ]]; then
    echo "Mic: muted"
else
    echo "Mic: unmuted"
fi
