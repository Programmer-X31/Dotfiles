#!/usr/bin/env bash

zscroll --delay 0.3 \
    --l 35 \
    --scroll-padding " *** " \
		--update-check true "playerctl metadata -f '{{title}} - {{artist}}'" &

wait
