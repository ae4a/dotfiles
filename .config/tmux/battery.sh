P="$(upower -i $(upower -e | grep 'BAT') | grep 'percentage' | awk '{print $2}' | tr -d "%")"

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
if [ "$(upower -i $(upower -e | grep 'BAT') | grep state | awk '{print $2}')" == "charging" ]; then
  POWER_ICON=" "
fi

echo "$POWER_ICON$ICON$P%"
