#!/bin/bash

WALLPAPER_DIR="/home/$USER/Pictures/wallpaper"

# Check if swww daemon is running, and initialize it if not
if ! swww query >/dev/null 2>&1; then
  swww init
  sleep 1
fi

# Find all files in the directory and select one randomly (using 'shuf')
# Adjust the file extension pattern as needed (e.g., "*.png" "*.gif")
find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | shuf -n 1 | while read -r WALLPAPER_PATH; do
  # Set the wallpaper with a transition
  swww img "$WALLPAPER_PATH" \
    --transition-type outer \
    --transition-duration 3 \
    --transition-fps 60

  # Optional: Display the name of the new wallpaper
  notify-send "New wallpaper: $(basename "$WALLPAPER_PATH")"
done
