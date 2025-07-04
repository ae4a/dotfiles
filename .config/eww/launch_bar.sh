#!/bin/bash

eww daemon

MONITOR_IDS=$(hyprctl monitors -j | jq -r '.[].id')

for ID in $MONITOR_IDS; do
  eww open bar --id $ID --arg monitor-id="$ID"
done

# scripts that update variables
~/.config/eww/scripts/audio.sh &
~/.config/eww/scripts/brightness.sh &
~/.config/eww/scripts/wifi.sh &
