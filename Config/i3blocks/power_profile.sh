#!/bin/sh

POWERPROFILESCTL=/usr/bin/powerprofilesctl

# Handle click
if [ "$BLOCK_BUTTON" = "1" ]; then
    CURRENT=$($POWERPROFILESCTL get 2>/dev/null)

    case "$CURRENT" in
        performance)
            $POWERPROFILESCTL set balanced
            ;;
        balanced)
            $POWERPROFILESCTL set power-saver
            ;;
        power-saver)
            $POWERPROFILESCTL set performance
            ;;
    esac

    pkill -RTMIN+3 i3blocks
fi

PROFILE=$($POWERPROFILESCTL get 2>/dev/null)

if [ -z "$PROFILE" ]; then
    echo "Power: unavailable"
else
    echo "Power: $PROFILE"
fi
