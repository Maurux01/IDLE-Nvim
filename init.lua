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
  use { 'HiPhish/rainbow-delimiters.nvim' }
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/mason.nvim' }
  use { 'williamboman/mason-lspconfig.nvim' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'jose-elias-alvarez/null-ls.nvim' }
  use { 'lewis6991/gitsigns.nvim' }
  use { 'numToStr/Comment.nvim' }
  use { 'folke/which-key.nvim' }
  use { 'windwp/nvim-autopairs' }
  use { 'kylechui/nvim-surround' }
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && npm install', ft = { 'markdown' } }
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use { 'folke/tokyonight.nvim' }
  use { 'morhetz/gruvbox' }
  use { 'dracula/vim', as = 'dracula' }
  use { 'shaunsingh/nord.nvim' }
  use { 'navarasu/onedark.nvim' }
  use { 'EdenEast/nightfox.nvim' }
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

-- RAINBOW DELIMITERS: brackets/paréntesis/llaves de colores
local rainbow_delimiters = require 'rainbow-delimiters'
vim.g.rainbow_delimiters = {
  strategy = {
    [''] = rainbow_delimiters.strategy['global'],
    vim = rainbow_delimiters.strategy['local'],
  },
  query = {
    [''] = 'rainbow-delimiters',
    lua = 'rainbow-blocks',
  },
  highlight = {
    'RainbowDelimiterRed', 'RainbowDelimiterYellow', 'RainbowDelimiterBlue',
    'RainbowDelimiterOrange', 'RainbowDelimiterGreen', 'RainbowDelimiterViolet', 'RainbowDelimiterCyan',
  },
}

-- === COLORSCHEME ROTATOR ===
local colorschemes = {
  'catppuccin', 'tokyonight', 'gruvbox', 'dracula', 'nord', 'onedark', 'nightfox', 'desert'
}
local cs_index = 1
function _G.CycleColorscheme()
  cs_index = cs_index % #colorschemes + 1
  vim.cmd('colorscheme ' .. colorschemes[cs_index])
  print('Colorscheme: ' .. colorschemes[cs_index])
end
vim.api.nvim_set_keymap('n', '<leader>cs', ':lua CycleColorscheme()<CR>', { noremap = true, silent = true })

-- === KEYBINDS FÁCILES ===
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Explorador de archivos
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
-- Buscar archivos
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
-- Buscar texto
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
-- Terminal flotante
map('n', '<leader>t', ':ToggleTerm direction=float<CR>', opts)
-- Servidor web
map('n', '<leader>ws', ':TermExec cmd="python -m http.server 8000"<CR>', opts)
-- Navegador web (w3m)
map('n', '<leader>wb', ':TermExec cmd="w3m google.com"<CR>', opts)
-- Comentar línea/selección
map('n', '<leader>/', ':lua require("Comment.api").toggle.linewise.current()<CR>', opts)
-- Surround (modo normal)
map('n', '<leader>s', '<cmd>lua require("nvim-surround").normal_surround()<CR>', opts)
-- Which-key menú
map('n', '<leader>?', ':WhichKey<CR>', opts)

-- === WHICH-KEY REGISTRO DE ATJOS ===
local wk = require('which-key')
wk.register({
  ['<leader>'] = {
    e = 'Explorador de archivos',
    ff = 'Buscar archivos',
    fg = 'Buscar texto',
    t = 'Terminal flotante',
    ws = 'Servidor web (python)',
    wb = 'Navegador web (w3m)',
    cs = 'Cambiar colorscheme',
    ["/"] = 'Comentar línea',
    s = 'Surround',
    ['?'] = 'Mostrar menú de atajos',
  }
})

-- OPCIONES BÁSICAS
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true

-- LSP y autocompletado
require('mason').setup{}
require('mason-lspconfig').setup{
  ensure_installed = { 'html', 'cssls', 'tsserver', 'pyright', 'lua_ls' },
}
local lspconfig = require('lspconfig')
local servers = { 'html', 'cssls', 'tsserver', 'pyright', 'lua_ls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {}
end

-- Autocompletado
local cmp = require'cmp'
local luasnip = require'luasnip'
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }),
})

-- null-ls para linters/formatters
require('null-ls').setup{}

-- Gitsigns
require('gitsigns').setup{}

-- Comment.nvim
require('Comment').setup{}

-- Autopairs
require('nvim-autopairs').setup{}

-- Surround
require('nvim-surround').setup{}

-- Markdown preview (solo para markdown)
vim.g.mkdp_auto_start = 0

-- Cambia el tema aquí (descomenta el que prefieras)
-- vim.cmd [[colorscheme catppuccin]]
-- vim.cmd [[colorscheme tokyonight]]
-- vim.cmd [[colorscheme gruvbox]]
-- vim.cmd [[colorscheme dracula]]
-- vim.cmd [[colorscheme nord]]
-- vim.cmd [[colorscheme onedark]]
-- vim.cmd [[colorscheme nightfox]]
vim.cmd [[colorscheme desert]] -- Tema por defecto 