#!/bin/sh
player_status=$(playerctl -p ncspot status 2> /dev/null)
if [ "$player_status" = "Playing" ]; then
    echo "ﱘ $(playerctl -p ncspot metadata artist) - $(playerctl -p ncspot metadata title)"
elif [ "$player_status" = "Paused" ]; then
    echo "ﱙ $(playerctl -p ncspot metadata artist) - $(playerctl -p ncspot metadata title)"
fi
