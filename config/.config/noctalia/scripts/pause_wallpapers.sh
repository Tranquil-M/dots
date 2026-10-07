#!/usr/bin/env bash

# temporary script atleast until mpvpaper adds support for auto wallpaper stopping
while true; do

    active_monitor=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')
    window_count=$(hyprctl clients -j | jq --argjson ws "$(hyprctl activeworkspace -j | jq '.id')" '[.[] | select(.workspace.id == $ws and .floating == false)] | length')
    
    if [ "$window_count" -gt 0 ]; then
        noctalia msg plugin noctalia/mpvpaper:service all pause
        echo pause "$active_monitor"
    else
        noctalia msg plugin noctalia/mpvpaper:service all resume 
        echo resume "$active_monitor"
    fi

    sleep 1
done
