#!/bin/sh

if ipconfig getifaddr en0 >/dev/null 2>&1; then
  sketchybar --set "$NAME" icon="󰤨" label.drawing=off
else
  sketchybar --set "$NAME" icon="󰤭" label.drawing=off
fi
