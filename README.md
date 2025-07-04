# IDLE-Nvim

Personal Neovim configuration to turn it into a super IDE for web development.

## Main Features
- Advanced syntax highlighting (Treesitter)
- Indent Rainbow (indentation colors)
- Rainbow Delimiters (colored brackets/parentheses/braces)
- Modern status bar (Lualine)
- File explorer (Nvim-tree)
- Powerful search (Telescope)
- Icons (Web-devicons)
- Integrated terminal (Toggleterm)
- LSP and intelligent autocompletion
- Automatic linters and formatters
- Git integration (Gitsigns)
- Quick comments
- Surround and autopairs
- Markdown preview
- Multiple color themes with easy rotation
- Command to launch web server (`<leader>ws`)
- Command to open web browser in terminal (`<leader>wb` with w3m)

---

## Installation

### Linux (Debian, Ubuntu, Fedora, Arch, etc.)

1. Clone this repository:
   ```sh
   git clone https://github.com/Maurux01/IDLE-Nvim.git
   cd IDLE-Nvim
   ```
2. Give permissions and run the installer:
   ```sh
   chmod +x install.sh
   ./install.sh
   ```
3. Open Neovim and run `:PackerSync` to install the plugins.

### Windows

1. Clone this repository and enter the folder:
   ```powershell
   git clone https://github.com/Maurux01/IDLE-Nvim.git
   cd IDLE-Nvim
   ```
2. Run the installer as administrator:
   ```powershell
   .\install.bat
   ```
   If you don't have Chocolatey, the script will give you instructions to install it.
3. Open Neovim and run `:PackerSync` to install the plugins.

---

## Quick Usage

### Navigation and files
- **File explorer:** `<leader>e`
- **Find files:** `<leader>ff`
- **Search text:** `<leader>fg`
- **Floating terminal:** `<leader>t`

### Web development
- **Launch web server:** `<leader>ws` (uses Python on port 8000)
- **Web browser in terminal:** `<leader>wb` (opens w3m)

### Productivity
- **Change color scheme:** `<leader>cs` (rotates between all themes)
- **Comment line:** `<leader>/`
- **Surround:** `<leader>s`
- **View keybindings menu:** `<leader>?`

### Autocompletion
- **Activate autocompletion:** `<C-Space>`
- **Confirm selection:** `<Enter>`
- **Navigate suggestions:** `<C-b>` and `<C-f>`

> `<leader>` is usually `\` or `,` depending on your Neovim configuration.

---

## Included Themes
- Catppuccin
- Tokyo Night
- Gruvbox
- Dracula
- Nord
- One Dark
- Nightfox
- Desert (default)

Use `<leader>cs` to switch between them.

---

## Additional Requirements
- To browse web pages in terminal, make sure you have `w3m` installed (the installer does this for you).
- For better visual experience, use a Nerd Font in your terminal.

---

## Customization
You can edit the `init.lua` file to:
- Add more plugins
- Change keybindings
- Modify LSP configurations
- Customize themes

---

## Credits
- Based on open source plugins from the Neovim community.
- Configuration optimized for modern web development.

## Keybindings Table

| Keybinding         | Action                        |
|-------------------|-------------------------------|
| `<Alt-e>`         | Toggle file explorer           |
| `<Alt-f>`         | Find files (Telescope)         |
| `<Alt-g>`         | Search text (Telescope)        |
| `<Alt-t>`         | Floating terminal              |
| `<Alt-s>`         | Change colorscheme             |
| `<Alt-/>`         | Comment line/selection         |
| `<Alt-q>`         | Surround (normal mode) / Quit  |
| `<Alt-w>`         | Start web server (Python)      |
| `<Alt-b>`         | Open web browser (w3m)         |
| `<Alt-?>`         | Show which-key menu            |
| `<Alt-S>`         | Save file                      |
| `<Alt-n>`         | New tab                        |
| `<Alt-]>`         | Next tab                       |
| `<Alt-[>`         | Previous tab                   |
| `<Alt-h>`         | Split window horizontally      |
| `<Alt-v>`         | Split window vertically        |
| `<Alt-Left>`      | Move to left window            |
| `<Alt-Right>`     | Move to right window           |
| `<Alt-Up>`        | Move to upper window           |
| `<Alt-Down>`      | Move to lower window           |
| `<leader>e`       | Toggle file explorer           |
| `<leader>ff`      | Find files (Telescope)         |
| `<leader>fg`      | Search text (Telescope)        |
| `<leader>t`       | Floating terminal              |
| `<leader>cs`      | Change colorscheme             |
| `<leader>/`       | Comment line/selection         |
| `<leader>s`       | Surround (normal mode)         |
| `<leader>ws`      | Start web server (Python)      |
| `<leader>wb`      | Open web browser (w3m)         |
| `<leader>?`       | Show which-key menu            |

> `<leader>` is the space bar (`Space`) in your config.

You can use either the Alt-based shortcuts or the `<leader>` ones, whichever you find more comfortable!
