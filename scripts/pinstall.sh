#!/bin/bash

# Script that makes it easy to instasll packages with yay.
# Will add the installed package to the package list for if we
# ever need to reinstall system.

pinstall() {
  pkg="$(yay -Slq | fzf --preview='yay -Si {1}')"
  [[ -z "$pkg" ]] && return 0

  # install it
  if yay -S --needed --noconfirm "$pkg"; then
    grep -qxF "$pkg" ~/dotfiles/scripts/install-system/pkglist.txt || echo "$pkg" >>~/dotfiles/scripts/install-system/pkglist.txt
    echo "Added $pkg to pkglist.txt"
  else
    echo "Installation failed - not added to pkglist.txt"
  fi
}
