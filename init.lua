-- PACKER: gestor de plugins
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'lukas-reineke/indent-blankline.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { 'akinsho/toggleterm.nvim', tag = '*' }
end)

-- TREESITTER: resaltado de sintaxis
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "html", "css", "javascript", "lua", "python", "json", "bash" },
  highlight = { enable = true },
}

-- INDENT RAINBOW
require("indent_blankline").setup {
    char = "│",
    show_trailing_blankline_indent = false,
    show_current_context = true,
    show_current_context_start = true,
}

-- LUALINE
require('lualine').setup {}

-- NVIM-TREE
require('nvim-tree').setup {}

-- TOGGLETERM: terminal integrada
require('toggleterm').setup{
  open_mapping = [[<c-\>]],
  direction = 'float',
}

-- TELESCOPE
require('telescope').setup{}

-- MAPAS ÚTILES
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })

-- SERVIDOR WEB: comando para lanzar servidor en terminal integrada
vim.api.nvim_set_keymap('n', '<leader>ws', ':TermExec cmd="python -m http.server 8000"<CR>', { noremap = true, silent = true })

-- NAVEGADOR WEB EN TERMINAL: comando para abrir w3m
vim.api.nvim_set_keymap('n', '<leader>wb', ':TermExec cmd="w3m google.com"<CR>', { noremap = true, silent = true })

-- OPCIONES BÁSICAS
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true

-- TEMA DE COLORES (puedes cambiarlo por el que prefieras)
vim.cmd [[colorscheme desert]] 