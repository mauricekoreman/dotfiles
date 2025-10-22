#!/bin/bash

_checkCommandExists() {
  cmd="$1"
  if ! command -v "$cmd" >/dev/null; then
    echo 1
    return
  fi
  echo 0
  return
}

threshhold_green=0
threshhold_yellow=25
threshhold_red=100

script_name=$(basename "$0")

# Count the instances
instance_count=$(ps aux | grep -F "$script_name" | grep -v grep | grep -v $$ | wc -l)

if [ $instance_count -gt 1 ]; then
  sleep $instance_count
fi

# -----------------------------------------------------
# Check for updates
# -----------------------------------------------------

# Arch
if [[ $(_checkCommandExists "pacman") == 0 ]]; then
  # aur_helper="$(cat ~/.config/ml4w/settings/aur.sh)"

  check_lock_files() {
    local pacman_lock="/var/lib/pacman/db.lck"
    local checkup_lock="${TMPDIR:-/tmp}/checkup-db-${UID}/db.lck"

    while [ -f "$pacman_lock" ] || [ -f "$checkup_lock" ]; do
      sleep 1
    done
  }

  check_lock_files

  updates_aur=$(yay -Qum | wc -l)
  updates_pacman=$(checkupdates | wc -l)
  updates=$((updates_aur + updates_pacman))
else
  updates=0
fi

# -----------------------------------------------------
# Output in JSON format for Waybar Module custom-updates
# -----------------------------------------------------

css_class="green"

if [ "$updates" -gt $threshhold_yellow ]; then
  css_class="yellow"
fi

if [ "$updates" -gt $threshhold_red ]; then
  css_class="red"
fi

if [ "$updates" != 0 ]; then
  if [ "$updates" -gt $threshhold_green ]; then
    printf '{"text": "%s", "alt": "%s", "tooltip": "Click to update your system", "class": "%s"}' "$updates" "$updates" "$css_class"
  else
    printf '{"text": "0", "alt": "0", "tooltip": "No updates available", "class": "green"}'
  fi
fi
