#!/bin/bash

# pipe cliphist list to fuzzel and get the selected entry with ID
selection=$(cliphist list | fuzzel --dmenu --with-nth 2 "$@")

fuzzel_exit_code=$?

if [[ -z "$selection" ]]; then
  exit 0
fi

if [[ $fuzzel_exit_code == 0 ]]; then
  echo -e "$selection" | cliphist decode | wl-copy
  notify-send "Copied '$selection' to clipboard!"
elif [[ $fuzzel_exit_code == 10 ]]; then
  echo -e "$selection" | cliphist delete
  notify-send "Deleted from clipboard!"
fi
