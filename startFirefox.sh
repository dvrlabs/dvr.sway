#!/bin/bash

URL1="https://www.youtube.com/watch?v=mgSxfYiQLos"
URL2="https://www.office.com/?auth=2"
URL3="https://outlook.office.com/mail/"
URL4="https://chat.openai.com"

firefox -new-window -P default-release \
        -new-tab $URL1 \
        -new-tab $URL2 \
        -new-tab $URL3 \
        -new-tab $URL4 & 

sleep 5

TITLE='[title="'$(swaymsg -t get_tree | jq -r '.nodes[].nodes[].nodes[] | select(.app_id == "firefox") | .name' | head -n 1)'"]'
MOVE='move container to workspace "1"'

swaymsg $TITLE $MOVE

