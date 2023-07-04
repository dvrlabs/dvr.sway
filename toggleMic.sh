#!/bin/bash

MIC_NAME='alsa_input.usb-GeneralPlus_USB_Audio_Device-00.mono-fallback'
SOCK_PATH='/tmp/wob.sock'

# Toggle mute
pactl set-source-mute "$MIC_NAME" toggle

# Check mute status
MUTE_STATUS=$(pactl list sources | awk -v name="$MIC_NAME" '/Name:/{flag=0} $0 ~ name {flag=1} flag && /Mute:/ {print $2; exit}')

# Report to wob
if [ "$MUTE_STATUS" = 'yes' ]; then
    echo 0 > $SOCK_PATH
else
    pactl set-source-volume "$MIC_NAME" 80%
    echo 80 > $SOCK_PATH
fi

