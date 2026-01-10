#!/bin/bash

# Script for showing all keybindings

declare -A bindings

bindings['Open terminal']='Super Enter'
bindings['Open browser']='Super B'
bindings['Kill active']='Super Q'
bindings['Exit hyprland']='Super M'
bindings['Open filemanager']='Super E'
bindings['Toggle floating']='Super F'
bindings['Open app launcher']='Super Space'
bindings['Toggle split']='Super O'
bindings['Open password manager']='Super P'
bindings['Open BTOP']='Super T'
bindings['System state menu']='Super SHIFT L '
bindings['Open clipboard']='Super V'
bindings['Screenshot window']='Printscreen'
bindings['Screenshot region']='SHIFT Print'
bindings['Lock screen']='Super CTRL Q'
bindings['Restart waybar']='Super SHIFT W'
bindings['Random wallpaper']='Super SHIFT G'
bindings['Open keybindings']='Super SHIFT K'
bindings['Swap/move window [direction]']='Super Ctrl left/right/up/down'

for desc in "${!bindings[@]}"; do
  key="${bindings[$desc]}"
  # Format: Keybinding (Key) -> Description (Value)
  echo "${key}: ${desc}" >>/tmp/keybindings_list.txt
done

# Use 'column -t -s:' to align the output neatly before piping to fuzzel
# The '-t' creates a table, and '-s:' specifies the column separator.
column -t -s ':' /tmp/keybindings_list.txt | fuzzel --dmenu -i --hide-prompt -w 60

# Clean up the temporary file
rm /tmp/keybindings_list.txt
