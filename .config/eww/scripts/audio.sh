eww update volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"

pactl subscribe | while read -r line; do
  if [[ $line =~ "change" ]]; then
    eww update volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"
  fi
done

