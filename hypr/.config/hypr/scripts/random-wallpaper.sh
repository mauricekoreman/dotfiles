#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/dotfiles/backgrounds"

WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

hyprctl hyprpaper reload ,"$WALLPAPER"
