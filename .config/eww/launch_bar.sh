#!/bin/bash

MONITOR_IDS=$(hyprctl monitors -j | jq -r '.[].id')

for ID in $MONITOR_IDS; do
  echo "MONITOR: $ID"
  eww open bar --id $ID --arg monitor-id="$ID"
done
