#!/bin/bash

eww update brightnessMax=$(brightnessctl max)
eww update brightness=$(brightnessctl get)

dbus-monitor interface='org.freedesktop.DBus.Properties',member='PropertiesChanged' --profile | grep --line-buffered backlight | while  read line; do
  # TODO Will be changed 4 times per change - change
  eww update brightness=$(brightnessctl get)
done
