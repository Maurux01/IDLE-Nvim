# idlenvim: The Ultimate Neovim + Tmux IDE Setup

> **Turn your terminal into a beautiful, fast, AI-powered IDE on any Linux!**

---

## 🚀 Quick Start

1. **Clone this repository:**
   ```sh
   git clone https://github.com/tuusuario/idlenvim.git
   cd idlenvim
   ```
2. **Run the installer:**
   ```sh
   chmod +x install.sh
   ./install.sh
   ```
   - The script will:
     - Install all required dependencies (Neovim, tmux, git, node, python, etc.)
     - Copy all config files to `~/.config/`
     - Install Neovim and tmux plugins
     - Offer to install a Nerd Font for icons

---

## ✨ Features

- **All the best color schemes** (switch instantly with `<leader>cs`)
- **AI-powered coding:**
  - Copilot (always on, toggle with `<leader>cc`)
  - Codeium (free alternative)
  - ChatGPT.nvim (edit, refactor, explain, delete code with AI)
- **Modern UI:** Animations, status bar, bufferline, file explorer, icons, notifications
- **Easy keybinds:** which-key, legendary, hydra
- **Productivity:** Telescope, Treesitter, LSP, autocompletion, commenting, TODOs, navigation, Harpoon, and more
- **Beautiful tmux config:** Powerline bar, plugins, easy keybinds, dark theme
- **Works on any Linux**

---

## 🛠️ Prerequisites

The installer will try to install these for you, but you can check manually:

- Neovim 0.9+ (`nvim --version`)
- tmux
- git
- nodejs & npm
- python3 & pip
- [Nerd Font](https://www.nerdfonts.com/) (for icons)
- Recommended: `ripgrep`, `fd`, `fzf`

> **Tip:** For best experience, use a terminal that supports true color and set a Nerd Font in your terminal preferences.

---

## 🧩 Manual Installation (Optional)

If you want to install manually or customize before setup:

1. Copy configs:
   ```sh
   cp -r .config/nvim ~/.config/
   cp -r .config/tmux ~/.config/
   ```
2. Install Neovim plugins:
   ```sh
   nvim
   :Lazy sync
   ```
3. Install tmux plugins:
   - Start tmux: `tmux`
   - Press `Ctrl-a I` (capital i) to install plugins with tpm

---

## 🖥️ Usage Guide

### Color Scheme Switch
- Press `<leader>cs` (space + c + s) to open the color scheme menu and pick your favorite.

### Copilot (AI Autocomplete)
- Copilot is always enabled by default.
- Toggle Copilot with `<leader>cc` (space + c + c).

### Codeium
- Codeium is enabled if installed. No toggle by default.

### ChatGPT.nvim (AI Edit/Refactor)
- Select code in visual mode, press `<leader>ai`, and type your instruction ("Refactor", "Explain", "Delete", etc). The AI will edit the code for you.
- **Requires your [OpenAI API key](https://platform.openai.com/account/api-keys)**. Set it in your environment or ChatGPT.nvim config.

### Keybinds
- `<leader>` is the space bar.
- All keybinds are discoverable with which-key (just press `<leader>`).

### Tmux
- Prefix is `Ctrl-a` (not `Ctrl-b`).
- Reload config: `Ctrl-a r`
- Install plugins: `Ctrl-a I`
- Powerline status bar, mouse support, and more.

## ⌨️ Keybinds Quick Reference

| Keybind         | Mode      | Description                                 |
|-----------------|-----------|---------------------------------------------|
| `<leader>`      | Normal    | Space bar (leader key for all mappings)     |
| `<leader>cs`    | Normal    | Switch color scheme                         |
| `<leader>cc`    | Normal    | Toggle Copilot (AI autocomplete)            |
| `<leader>ai`    | Visual    | Edit/refactor code with ChatGPT.nvim        |
| `<leader>ff`    | Normal    | Find files (Telescope)                      |
| `<leader>fg`    | Normal    | Live grep (Telescope)                       |
| `<leader>fb`    | Normal    | List open buffers (Telescope)               |
| `<leader>fo`    | Normal    | Recent files (Telescope)                    |
| `<leader>/'`    | Normal    | Fuzzy search in current buffer              |
| `<leader>e`     | Normal    | Toggle file explorer (nvim-tree/neo-tree)   |
| `<leader>tt`    | Normal    | Toggle Trouble (diagnostics)                |
| `<leader>h`     | Normal    | Harpoon quick menu                         |
| `<leader>m`     | Normal    | Toggle minimap (if enabled)                 |
| `<leader>/'`    | Normal    | Fuzzy search in buffer                      |
| `<leader>c`     | Normal    | Comment line/selection                      |
| `<leader>u`     | Normal    | Toggle undo tree (if enabled)               |
| `<Tab>`/`<S-Tab>` | Insert  | Next/prev completion (nvim-cmp)             |
| `<C-Space>`     | Insert    | Trigger completion menu                     |
| `gd`            | Normal    | Go to definition (LSP)                      |
| `gr`            | Normal    | Go to references (LSP)                      |
| `K`             | Normal    | Hover docs (LSP)                            |
| `[d`/`]d`       | Normal    | Prev/next diagnostic (LSP)                  |
| `\`             | Normal    | which-key popup (shows all mappings)        |
| `Ctrl-a`        | tmux      | tmux prefix (instead of Ctrl-b)             |
| `Ctrl-a r`      | tmux      | Reload tmux config                          |
| `Ctrl-a I`      | tmux      | Install tmux plugins                        |
| `Ctrl-a c`      | tmux      | New tmux window                             |
| `Ctrl-a n/p`    | tmux      | Next/prev tmux window                       |
| `Ctrl-a [`      | tmux      | Enter copy mode                             |
| `Ctrl-a d`      | tmux      | Detach session                              |

> For more, press `<leader>` in normal mode to see all available keybinds (which-key).

---

## ⚙️ Customization

- All config is modular in `.config/nvim/lua/`.
- Add/remove plugins in `plugins.lua`.
- Change default color scheme in `colors.lua`.
- Add your LSP servers in `lsp.lua`.
- Tweak tmux in `.config/tmux/.tmux.conf`.

---

## 🧑‍💻 Troubleshooting & Tips

- If plugins don't load, run `:Lazy sync` in Neovim.
- For tmux plugin issues, run `Ctrl-a I` again inside tmux.
- For font/icon issues, make sure you use a Nerd Font in your terminal.
- If a dependency fails to install, check your package manager or install manually.
- For ChatGPT.nvim, set your OpenAI API key as an environment variable:
  ```sh
  export OPENAI_API_KEY=sk-...
  ```

---

## 🎉 Enjoy your supercharged Neovim + tmux IDE!

> **Questions or suggestions? Open an issue or PR!**