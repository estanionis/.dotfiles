#!/bin/sh

# 1. Įdiegiame chezmoi, jei jo nėra
if ! command -v chezmoi >/dev/null 2>&1; then
  echo "Installing chezmoi..."
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
  export PATH="$HOME/.local/bin:$PATH"
fi

# 2. Inicializuojame nustatymus
# Naudojame --force, kad perrašytų numatytuosius konteinerio failus
echo "Applying dotfiles with chezmoi..."
~/.local/bin/chezmoi init --apply --force estanionis
