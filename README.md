# idlenvim: The Ultimate Neovim + Tmux IDE Setup

## Features
- **All the best color schemes** (switch with `<leader>cs`)
- **AI-powered coding**: Copilot (always on, toggle with `<leader>cc`), Codeium, ChatGPT.nvim (edit, refactor, explain, delete code with AI)
- **Modern UI**: Animations, status bar, bufferline, file explorer, icons, notifications
- **Easy keybinds**: which-key, legendary, hydra
- **Productivity**: Telescope, Treesitter, LSP, autocompletion, commenting, TODOs, navigation, Harpoon, and more
- **Beautiful tmux config**: Powerline bar, plugins, easy keybinds, dark theme
- **Works on any Linux**

---

## Installation

### 1. Prerequisites
- Neovim 0.9+ (`nvim --version`)
- tmux
- git
- nodejs & npm
- python3 & pip
- [Nerd Font](https://www.nerdfonts.com/) (for icons)
- Recommended: `ripgrep`, `fd`, `fzf`

### 2. Copy Configs
Clone or copy the `.config/nvim` and `.config/tmux` folders to your `$HOME/.config/` directory:

```sh
cp -r .config/nvim ~/.config/
cp -r .config/tmux ~/.config/
```

### 3. Install Neovim Plugins
Open Neovim and run:

```
:Lazy sync
```

### 4. Install tmux Plugins
Start tmux and press `Ctrl-a I` (capital i) to install plugins with tpm.

---

## Usage

### Color Scheme Switch
- Press `<leader>cs` (space + c + s) to open the color scheme menu and pick your favorite.

### Copilot (AI Autocomplete)
- Copilot is always enabled by default.
- Toggle Copilot with `<leader>cc` (space + c + c).

### Codeium
- Codeium is enabled if installed. No toggle by default.

### ChatGPT.nvim (AI Edit/Refactor)
- Select code in visual mode, press `<leader>ai`, and type your instruction ("Refactor", "Explain", "Delete", etc). The AI will edit the code for you.
- Requires your [OpenAI API key](https://platform.openai.com/account/api-keys). Set it in your environment or ChatGPT.nvim config.

### Keybinds
- `<leader>` is the space bar.
- All keybinds are discoverable with which-key (just press `<leader>`).

### Tmux
- Prefix is `Ctrl-a` (not `Ctrl-b`).
- Reload config: `Ctrl-a r`
- Install plugins: `Ctrl-a I`
- Powerline status bar, mouse support, and more.

---

## Customization
- All config is modular in `.config/nvim/lua/`.
- Add/remove plugins in `plugins.lua`.
- Change default color scheme in `colors.lua`.
- Add your LSP servers in `lsp.lua`.

---

## Troubleshooting
- If plugins don't load, run `:Lazy sync` in Neovim.
- For tmux plugin issues, run `Ctrl-a I` again.
- For font/icon issues, make sure you use a Nerd Font in your terminal.

---

## Enjoy your supercharged Neovim + tmux IDE! 🎉