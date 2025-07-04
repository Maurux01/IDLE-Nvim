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
    echo "Distribución no soportada automáticamente. Instala manualmente: neovim python3 python3-pip w3m git curl"
    exit 1
fi

# Actualizar repositorios
$UPDATE

# Instalar dependencias
$PKG neovim python3 python3-pip w3m git curl

# Instalar packer.nvim
NVIM_DATA_DIR="$HOME/.local/share/nvim/site/pack/packer/start"
if [ ! -d "$NVIM_DATA_DIR/packer.nvim" ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim "$NVIM_DATA_DIR/packer.nvim"
fi

# Crear config si no existe
mkdir -p "$HOME/.config/nvim"

# Copiar init.lua si existe en el repo
if [ -f "init.lua" ]; then
    cp init.lua "$HOME/.config/nvim/init.lua"
    echo "init.lua copiado a ~/.config/nvim/init.lua"
fi

echo "Listo. Abre Neovim y ejecuta :PackerSync para instalar los plugins." 