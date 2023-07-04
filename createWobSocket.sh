#!/bin/bash

SOCKET_PATH="/tmp/wob.sock"

if [ -S "${SOCKET_PATH}" ]; then
    rm "${SOCKET_PATH}"
fi

mkfifo "${SOCKET_PATH}"
tail -f "${SOCKET_PATH}" | wob

