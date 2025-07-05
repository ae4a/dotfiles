#!/bin/bash

# suppose if the script is executed either open or close will be called
# there may be only one popup at a time so close all other
for CLOSER in $(eww active-windows | grep popup | cut -d ':' -f 1); do
  eww close $CLOSER
done

if [[ $1 == "open" ]]; then
  POPUP=$2
  POPUP_MONITOR=$3
  MONITORS=$(hyprctl monitors -j | jq -r '.[].id')
  
  eww open $POPUP --screen $POPUP_MONITOR
  for ID in $MONITORS; do
    eww open closer --id "closer$ID" --arg monitor="$ID"
  done
elif [[ $1 == "close" ]]; then
  for CLOSER in $(eww active-windows | grep closer | cut -d ':' -f 1); do
    eww close $CLOSER
  done
fi

