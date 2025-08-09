if ! command -v uwsm >/dev/null 2>&1; then
  if uwsm check may-start; then
    exec uwsm start hyprland.desktop
  fi
fi
