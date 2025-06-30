#!/bin/bash

if [[ $1 == "open" ]]; then
  POPUP=$2
  POPUP_MONITOR=$3
  MONITORS=$(hyprctl monitors -j | jq -r '.[].id')
  
  for ID in $MONITORS; do
    eww open closer --id "closer$ID" --arg monitor="$ID" --arg popup="$POPUP"
  done
  eww open $POPUP --screen $POPUP_MONITOR
elif [[ $1 == "close" ]]; then
  POPUP=$2  

  eww close $POPUP
  for CLOSER in $(eww active-windows | cut -d ':' -f 1); do
    if [[ "$CLOSER" =~ "closer" ]]; then
      eww close $CLOSER
    fi
  done
fi

