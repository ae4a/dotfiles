#!/bin/bash

hyprctl activewindow -j | jq --raw-output .title

socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while IFS= read -r event; do
  if echo "$event" | grep -q "activewindow\|workspace\|monitor"; then
    hyprctl activewindow -j | jq --raw-output .title
  fi
done

