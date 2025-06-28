#!/bin/bash

if [[ "$1" == "up" ]]; then
  brightnessctl set 10%+ -q
elif [[ "$1" == "down" ]]; then
  brightnessctl set 10%- -q
fi

# Update eww value

eww update brightness=$(brightnessctl get)
