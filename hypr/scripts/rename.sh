#!/bin/bash

id=$(hyprctl activeworkspace -j | jq '.id')
name=$(hyprctl activeworkspace -j | jq '.name' -r )
name=${name:3}
echo "Rename workspace"
read -e -p "$id: " -i "$name" newname 
newname="$id: $newname"
if [ "$newname" == "" ]; then
    hyprctl dispatch renameworkspace $id
else
    hyprctl dispatch renameworkspace $id $newname
fi
