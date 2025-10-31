#!/bin/bash

# Script for system states

case "$(printf "Lock\nReboot\nShutdown" | fuzzel --dmenu --minimal-lines -i --hide-prompt)" in
"Shutdown") shutdown now ;;
"Reboot") reboot now ;;
"Lock") hyprlock ;;
*) exit 1 ;;
esac
