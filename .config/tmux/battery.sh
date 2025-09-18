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

echo "$ICON$P%"
