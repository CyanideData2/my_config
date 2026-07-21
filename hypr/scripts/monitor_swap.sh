#!/bin/env sh

TMP_FILE="$XDG_RUNTIME_DIR/hyprland-aux_monitor"
BIG_MONITOR="HDMI-A-1"
activeWindow=$(hyprctl clients -j | jq ".[] | select(.focusHistoryID == 0) | .pid")
read -d "\n" WORKSPACE_A WORKSPACE_B <<< $(hyprctl monitors -j | jq '.[].activeWorkspace.id')

exit

if [ -s "$TMP_FILE-$CURRENT_WORKSPACE" ]; then
  readarray -d $'\n' -t ADDRESS_ARRAY <<< $(< "$TMP_FILE-$CURRENT_WORKSPACE")

  for address in "${ADDRESS_ARRAY[@]}"
  do
    CMDS+="dispatch movetoworkspacesilent name:$CURRENT_WORKSPACE,address:$address;"
  done

  hyprctl --batch "$CMDS"

  rm "$TMP_FILE-$CURRENT_WORKSPACE"
else
  ADDRESSES_A=$(hyprctl clients -j | jq --arg CW "$WORKSPACE_A" '.[] | select (.workspace .name == $CW) | .address')
  ADDRESSES_B=$(hyprctl clients -j | jq --arg CW "$WORKSPACE_B" '.[] | select (.workspace .name == $CW) | .address')

  readarray -d $'\n' -t ADDRESSES_A <<< $ADDRESSES_A
  readarray -d $'\n' -t ADDRESSES_B <<< $ADDRESSES_B

  for address in "${ADDRESS_A[@]}"
  do
    address=$(sed 's/"//g' <<< $address )

    if [[ -n address ]]; then
      TMP_ADDRESS+="$address\n"
    fi

    CMDS+="dispatch movetoworkspacesilent special:aux,address:$address;"
  done

  hyprctl --batch "$CMDS"

  echo -e "$TMP_ADDRESS" | sed -e '/^$/d' > "$TMP_FILE-$CURRENT_WORKSPACE"
fi
