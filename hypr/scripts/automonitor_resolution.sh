#!/bin/sh

automonitors() {
  MONITOR_COUNT=$(hyprctl monitors -j | jq length)
  echo "Found $MONITOR_COUNT monitors"
  if [ $MONITOR_COUNT -gt 1 ]; then
    hyprctl --batch "keyword monitor HDMI-A-1,1920x1080@120.00Hz,0x0,1; keyword monitor eDP-1,1920x1080,-1281x150,1.5"
  else
    hyprctl keyword monitor eDP-1,preferred,0x0,1.2
  fi
}

automonitors

handle() {
  case $1 in
    monitoradded*) automonitors;;
    monitorremoved*) automonitors;;  
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done ##RERUNS CONFIG


