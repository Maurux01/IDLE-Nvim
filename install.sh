#!/usr/bin/env bash
set -e

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# Detect package manager
if command -v apt &>/dev/null; then
    PM="sudo apt-get install -y"
elif command -v dnf &>/dev/null; then
    PM="sudo dnf install -y"
elif command -v pacman &>/dev/null; then
    PM="sudo pacman -S --noconfirm"
else
    echo -e "${RED}No supported package manager found (apt, dnf, pacman). Install dependencies manually.${NC}"
    exit 1
fi

# Dependencies
DEPS=(neovim tmux git nodejs npm python3 python3-pip ripgrep fd-find fzf)

# Install missing dependencies
for dep in "${DEPS[@]}"; do
    if ! command -v ${dep%%-*} &>/dev/null; then
        echo -e "${GREEN}Installing $dep...${NC}"
        $PM $dep
    else
        echo -e "${GREEN}$dep already installed.${NC}"
    fi
done

# fd-find is called 'fd' on some distros
if ! command -v fd &>/dev/null && command -v fdfind &>/dev/null; then
    ln -sf $(which fdfind) ~/.local/bin/fd
fi

# Copy configs
mkdir -p ~/.config
cp -r .config/nvim ~/.config/
cp -r .config/tmux ~/.config/

# Install Neovim plugins
nvim --headless "+Lazy! sync" +qa

# Install tmux plugins
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
# Install tmux plugins (requires tmux running)
echo -e "${GREEN}To finish tmux plugin install, open tmux and press Ctrl-a I${NC}"

# Offer to install Nerd Font
read -p "Do you want to install a Nerd Font for icons? (y/n): " nerd
if [[ $nerd == "y" || $nerd == "Y" ]]; then
    FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"
    mkdir -p ~/.local/share/fonts
    cd ~/.local/share/fonts
    curl -LO $FONT_URL
    unzip -o JetBrainsMono.zip
    rm JetBrainsMono.zip
    fc-cache -fv
    echo -e "${GREEN}JetBrainsMono Nerd Font installed. Set it in your terminal preferences!${NC}"
    cd -
else
    echo -e "${GREEN}Skipping Nerd Font install. For best experience, use a Nerd Font!${NC}"
fi

echo -e "${GREEN}All done! Open Neovim and tmux and enjoy your new IDE!${NC}" 