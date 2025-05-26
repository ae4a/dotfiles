applyDefault() {
  hyprctl keyword monitor eDP-1, 1920x1200, 0x0, 1.2

  hyprctl keyword workspace 1, monitor:eDP-1
  hyprctl keyword workspace 2, monitor:eDP-1
  hyprctl keyword workspace 3, monitor:eDP-1
  hyprctl keyword workspace 4, monitor:eDP-1
  hyprctl keyword workspace 5, monitor:eDP-1
  hyprctl keyword workspace 6, monitor:eDP-1

  hyprctl dispatch moveworkspacetomonitor 1 0
  hyprctl dispatch moveworkspacetomonitor 2 0
  hyprctl dispatch moveworkspacetomonitor 3 0
  hyprctl dispatch moveworkspacetomonitor 4 0
  hyprctl dispatch moveworkspacetomonitor 5 0
  hyprctl dispatch moveworkspacetomonitor 6 0
  
  ln -f -s ~/.config/hypr/monitors/single.conf ~/.config/hypr/monitor.conf
}

applyHome() {
  hyprctl keyword monitor HDMI-A-1, 1920x1080, 0x0, 1
  hyprctl keyword monitor eDP-1, 1920x1200, 1920x0, 1.2

  hyprctl keyword workspace 1, monitor:HDMI-A-1
  hyprctl keyword workspace 2, monitor:HDMI-A-1
  hyprctl keyword workspace 3, monitor:HDMI-A-1
  hyprctl keyword workspace 4, monitor:eDP-1
  hyprctl keyword workspace 5, monitor:eDP-1
  hyprctl keyword workspace 6, monitor:eDP-1

  hyprctl dispatch moveworkspacetomonitor 1 1
  hyprctl dispatch moveworkspacetomonitor 2 1
  hyprctl dispatch moveworkspacetomonitor 3 1
  hyprctl dispatch moveworkspacetomonitor 4 0
  hyprctl dispatch moveworkspacetomonitor 5 0
  hyprctl dispatch moveworkspacetomonitor 6 0

  ln -f -s ~/.config/hypr/monitors/home.conf ~/.config/hypr/monitor.conf
}

applyHome69() {
  hyprctl keyword monitor HDMI-A-1, 2560x1440, 0x0, 1
  hyprctl keyword monitor eDP-1, 1920x1200 480x1440, 1.2

  hyprctl keyword workspace 4, monitor:HDMI-A-1
  hyprctl keyword workspace 5, monitor:HDMI-A-1
  hyprctl keyword workspace 6, monitor:HDMI-A-1
  hyprctl keyword workspace 1, monitor:eDP-1
  hyprctl keyword workspace 2, monitor:eDP-1
  hyprctl keyword workspace 3, monitor:eDP-1

  hyprctl dispatch moveworkspacetomonitor 1 0
  hyprctl dispatch moveworkspacetomonitor 2 0
  hyprctl dispatch moveworkspacetomonitor 3 0
  hyprctl dispatch moveworkspacetomonitor 4 1
  hyprctl dispatch moveworkspacetomonitor 5 1
  hyprctl dispatch moveworkspacetomonitor 6 1

  ln -f -s ~/.config/hypr/monitors/home69.conf ~/.config/hypr/monitor.conf
}

apply() {
  # Based on connected monitor
  case $1 in
    *2476WM*)
      echo "apply home config"
      applyHome
     ;;
    *27P505Q*)
      echo "apply home69 config"
      applyHome69
      ;;
  esac
}

# Handles existing monitors
handleExisting() {
  echo "handle existing monitors"

  # Check if there is only 1 monitor then apply default
  if (( $(hyprctl monitors | grep description | wc -l) == "1" )); then
    echo "now it is one monitor"
    applyDefault
  else
    hyprctl monitors | grep description | while read -r line; do apply "$line"; done
  fi
}

handle() {
  case $1 in
    monitoraddedv2*)
      echo "SOCKET added monitor $1" 
      apply "$1"
      ;;
    monitorremoved*)
      echo "SOCKET removed monitor"
      handleExisting
      ;;
  esac
}


# Handle existing monitors
handleExisting

# Handle changes
echo "starting linstening to socket"
socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
