#!/usr/bin/env bash
# https://bingwallpaper.anerg.com/archive/us/202409

WALLPAPER_DIR="$HOME/dotfiles/backgrounds"

WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

hyprctl hyprpaper reload ,"$WALLPAPER"
