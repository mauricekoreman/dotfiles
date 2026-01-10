#!/bin/bash

if [[ "$EUID" == 0 ]]; then
  echo "Please run this script as a user with sudo privilege."
  exit 1
fi

echo "Installing packages from pgklist.txt..."
sudo yay -Syu --noconfirm --needed - <pgklist.txt

echo "Enabling essential servives..."
# sudo systemctl enable NetworkManager

echo "Installation and configuration complete! Reboot is recommended."
