#!/bin/bash
socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
  if [[ "$line" == *"focusedmon"* ]]; then
    class=$(hyprctl activewindow -j | jq -r '.class')
    case "$class" in
      "osu!") 
        hyprctl keyword input:tablet:active_area_size 27 48
        ;;
      *)
        hyprctl keyword input:tablet:active_area_size 0 0
        ;;
    esac
  fi
done
