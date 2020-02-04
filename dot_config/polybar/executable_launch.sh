#!/bin/bash

# Launch one instance of primary bar for each connected monitor
for m in $(xrandr --query | grep -w connected | cut -d" " -f1); do
    MONITOR=$m polybar --reload primary &
done

echo "Polybar launched..."
