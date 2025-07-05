#!/bin/bash

hyprctl workspaces -j | jq -Mc

socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while IFS= read -r event; do
  if echo "$event" | grep -q "activewindow\|workspace\|monitor"; then
    hyprctl workspaces -j | jq -Mc
  fi
done
