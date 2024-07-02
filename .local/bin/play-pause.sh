#!/bin/sh

STATUS=$(playerctl --player=spotify status)

if [[ $STATUS == "Paused" ]]; then
    echo ""
elif [[ $STATUS == "Playing" ]]; then
    echo ""
else
    echo ""
fi
