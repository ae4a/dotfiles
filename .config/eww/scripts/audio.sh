eww update volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d ' ' -f 2)"

pactl subscribe | while read -r line; do
  if [[ $line =~ "change" ]]; then
    eww update volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d ' ' -f 2)"
  fi
done

