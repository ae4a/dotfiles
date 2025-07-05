#!/bin/bash

hyprctl monitors -j | jq -c '.[] | select(.focused == true) | .activeWorkspace.id'

socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while IFS= read -r event; do
  if echo "$event" | grep -q "activewindow\|workspace\|monitor\|focusedmon"; then
    hyprctl monitors -j | jq -Mc '.[] | select(.focused == true) | .activeWorkspace.id'
  fi
done
