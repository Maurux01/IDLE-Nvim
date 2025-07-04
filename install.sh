#!/bin/bash
set -e

# Detectar distribución
if [ -f /etc/debian_version ]; then
    PKG="sudo apt-get install -y"
    UPDATE="sudo apt-get update"
elif [ -f /etc/fedora-release ]; then
    PKG="sudo dnf install -y"
    UPDATE="sudo dnf check-update"
elif [ -f /etc/arch-release ]; then
    PKG="sudo pacman -Syu --noconfirm"
    UPDATE="sudo pacman -Sy"
else
    echo "Unsupported distribution. Please install Neovim, git, curl, and a Nerd Font manually."
    exit 1
fi

$UPDATE
$PKG neovim git curl unzip

# Crear config si no existe
mkdir -p "$HOME/.config/nvim"

# Copiar init.lua
cp init.lua "$HOME/.config/nvim/init.lua"
echo "init.lua copied to ~/.config/nvim/init.lua"

echo "Done! Open Neovim and run :Lazy sync to install all plugins." 