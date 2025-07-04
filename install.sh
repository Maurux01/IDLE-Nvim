#!/bin/bash

# Define la ruta de configuración de Neovim
NVIM_CONFIG_DIR="$HOME/.config/nvim"
SOURCE_DIR="$(pwd)"

echo "🚀 Iniciando la instalación de idleNvim para Linux/macOS..."

# Verifica si Neovim está instalado
if ! command -v nvim &> /dev/null; then
    echo "❌ Neovim no está instalado. Por favor, instálalo primero."
    exit 1
fi

# Crea una copia de seguridad de la configuración existente
if [ -d "$NVIM_CONFIG_DIR" ]; then
    echo "📦 Realizando copia de seguridad de la configuración existente en $NVIM_CONFIG_DIR.bak..."
    mv "$NVIM_CONFIG_DIR" "$NVIM_CONFIG_DIR.bak_$(date +%F-%T)"
fi

# Copia los archivos de configuración
echo "📋 Copiando los archivos de configuración a $NVIM_CONFIG_DIR..."
mkdir -p "$NVIM_CONFIG_DIR"
cp -r "$SOURCE_DIR/init.lua" "$NVIM_CONFIG_DIR/"
cp -r "$SOURCE_DIR/lua" "$NVIM_CONFIG_DIR/"

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ ¡La configuración de idleNvim se ha instalado correctamente!"
    echo "✨ Abre Neovim (ejecuta 'nvim') para que los plugins se instalen automáticamente."
else
    echo "❌ La instalación ha fallado. Por favor, revisa los errores."
fi
