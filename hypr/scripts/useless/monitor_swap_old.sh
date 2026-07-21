#!/bin/bash

# activeWindow=$(hyprctl clients -j | jq ".[] | select(.focusHistoryID == 0) | .address")

read -d "\n" workspaceA workspaceB <<< $(hyprctl monitors -j | jq '.[].activeWorkspace.id')
if [ -z "$workspaceB"  ]; then
    echo "Not working with two monitors"
    exit
fi

windowsA=$(hyprctl clients -j | jq ".[] | select(.workspace.id == $workspaceA) | .address")
windowsB=$(hyprctl clients -j | jq ".[] | select(.workspace.id == $workspaceB) | .address")

for address in $windowsA; do
    address=$(sed 's/"//g' <<< $address )
    CMDS+="dispatch movetoworkspacesilent special:aux,address:$address;"
done
for address in $windowsB; do
    address=$(sed 's/"//g' <<< $address )
    CMDS+="dispatch movetoworkspacesilent $workspaceA,address:$address;"
done
for address in $windowsA; do
    address=$(sed 's/"//g' <<< $address )
    CMDS+="dispatch movetoworkspace $workspaceB,address:$address;"
done

hyprctl --batch "$CMDS"

exit
