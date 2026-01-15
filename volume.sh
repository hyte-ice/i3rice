!/bin/bash
# Show volume and muted/unmuted status using pactl (pipewire/pulseaudio compatible)

sink=$(pactl get-default-sink)
if [[ -z "$sink" ]]; then
    echo "Volume: N/A"
    exit 0
fi

volume=$(pactl get-sink-volume "$sink" | grep -oP '\d+%' | head -1)
mute=$(pactl get-sink-mute "$sink" | awk '{print $2}')

if [[ "$mute" == "yes" ]]; then
    echo "Volume: $volume muted"
else
    echo "Volume: $volume unmuted"
fi
