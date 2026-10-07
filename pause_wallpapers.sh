#!/usr/bin/env bash

while true; do
    monitors=$(hyprctl monitors -j | jq -r '.[].name')
    monitors_with_windows=$(hyprctl clients -j | jq -r '.[].monitor')

    for monitor in $monitors; do
        if ! echo "$monitors_with_windows" | grep -qx "$monitor"; then
            echo "paused on $monitor"
        fi
    done

    sleep 2
done
