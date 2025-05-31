#!/bin/bash

DEVICE_ID=$(kdeconnect-cli -a | head -n1 | awk '{print $5}') #gets first paired device id
SCREENSHOT_DIR="$HOME/Pictures/Screenshots" #screenshots folder.
sent_any=0

while IFS= read -r filepath || [[ -n "$filepath" ]]; do
    if [[ -f "$filepath" ]]; then
        echo "📁 Sending: '$filepath'"
        kdeconnect-cli --device "$DEVICE_ID" --share "$filepath"
        sent_any=1
    else
        echo "⚠️ File Not Found: '$filepath'"
    fi
done < <(xclip -selection clipboard -o)

if [[ $sent_any -eq 0 ]]; then
    if xclip -selection clipboard -t image/png -o > /dev/null 2>&1; then
        LATEST_SCREENSHOT=$(find "$SCREENSHOT_DIR" -type f -printf "%T@ %p\n" | sort -n | tail -1 | cut -d' ' -f2-)
        if [[ -f "$LATEST_SCREENSHOT" ]]; then
            echo "🖼️ Raw png detected, sending most recent screenshot: $LATEST_SCREENSHOT"
            kdeconnect-cli --device "$DEVICE_ID" --share "$LATEST_SCREENSHOT"
            sent_any=1
        else
            echo "❌ Cannot find screenshot in desired folder."
        fi
    fi
fi

if [[ $sent_any -eq 0 ]]; then
    echo "❌ Couldn't find any file to send."
fi
