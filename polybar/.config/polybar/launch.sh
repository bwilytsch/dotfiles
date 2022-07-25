#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch 
echo "---" | tee -a /tmp/polybar-top.log 
# polybar v1 >>/tmp/polybar-top.log & disown

polybar utils &
polybar system &
polybar applications &

echo "Bars launched..."
