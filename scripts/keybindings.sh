#!/bin/bash

# Script for showing all keybindings

declare -A bindings

bindings['Open terminal']='SUPER Enter'
bindings['Open browser']='SUPER B'

for description in "${!bindings[@]}"; do
  combination="${bindings[${description}]}"

  echo "${description} - ${combination}"
done
