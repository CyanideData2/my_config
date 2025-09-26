#!/bin/bash

wacom_area=$(hyprctl getoption input:tablet:active_area_size | grep 'vec2' | awk '{print $2 $3}')

echo $wacom_area

# Toggle between two states
if [ "$wacom_area" == "[0,0]" ]; then
    hyprctl keyword input:tablet:active_area_size 48 27
    notify-send "Gaming mode!"
else
    hyprctl keyword input:tablet:active_area_size 0 0
    hyprctl reload
    notify-send "No more games :("
fi
