#!/bin/bash

#set -ex

P="??"

if [ "$(uname)" = "Darwin" ]; then 
  P="$(pmset -g batt | grep % | awk '{print $3}' | tr -d "%;")"
elif [ "$(uname)" = "Linux" ]; then
  P="$(upower -i $(upower -e | grep 'BAT') | grep 'percentage' | awk '{print $2}' | tr -d "%" )"
fi

ICON=" "
if [ "$P" -lt "20" ]; then
  ICON=" "
elif [ "$P" -lt "40" ]; then
  ICON=" "
elif [ "$P" -lt "60" ]; then
  ICON=" "
elif [ "$P" -lt "80" ]; then
  ICON=" "
fi

POWER_ICON=""

if [ "$(uname)" = "Darwin" ]; then 
  if [ "$(pmset -g batt | grep discharging | wc -l | tr -d " ")" == "0" ]; then
    POWER_ICON=" "
  fi
elif [ "$(uname)" = "Linux" ]; then
  if [ "$(upower -i $(upower -e | grep 'BAT') | grep state | awk '{print $2}')" == "charging" ]; then
    POWER_ICON=" "
  fi
fi

echo "$POWER_ICON$ICON$P%"
