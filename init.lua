vim.g.mapleader = ' '

-- LAZY.NVIM: Plugin manager moderno y rápido
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Syntax & UI
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'lukas-reineke/indent-blankline.nvim',
  'nvim-lualine/lualine.nvim',
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'akinsho/toggleterm.nvim', version = '*' },
  'HiPhish/rainbow-delimiters.nvim',
  -- LSP & Autocompletion
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'jose-elias-alvarez/null-ls.nvim',
  -- Productivity
  'lewis6991/gitsigns.nvim',
  'numToStr/Comment.nvim',
  'folke/which-key.nvim',
  'windwp/nvim-autopairs',
  'kylechui/nvim-surround',
  { 'iamcco/markdown-preview.nvim', build = 'cd app && npm install', ft = 'markdown' },
  -- Color schemes
  { 'catppuccin/nvim', name = 'catppuccin' },
  'folke/tokyonight.nvim',
  'morhetz/gruvbox',
  { 'dracula/vim', name = 'dracula' },
  'shaunsingh/nord.nvim',
  'navarasu/onedark.nvim',
  'EdenEast/nightfox.nvim',
  -- IA
  { 'Exafunction/codeium.nvim', dependencies = { 'nvim-lua/plenary.nvim', 'hrsh7th/nvim-cmp' } },
})

-- TREESITTER: Advanced syntax highlight
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "html", "css", "javascript", "lua", "python", "json", "bash" },
  highlight = { enable = true },
}

-- INDENT BLANKLINE v3 CONFIG
require("ibl").setup {
  indent = { char = "│" },
  scope = { enabled = false },
}

-- RAINBOW DELIMITERS: colored brackets/parentheses/braces
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

-- LUALINE
require('lualine').setup {}

-- NVIM-TREE
require('nvim-tree').setup {}

-- TOGGLETERM: Integrated terminal
require('toggleterm').setup{
  open_mapping = [[<c-\>]],
  direction = 'float',
}

-- TELESCOPE
require('telescope').setup{}

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

-- === EASY KEYBINDS ===
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- File explorer
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
-- Find files
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
-- Search text
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
-- Floating terminal
map('n', '<leader>t', ':ToggleTerm direction=float<CR>', opts)
-- Web server
map('n', '<leader>ws', ':TermExec cmd="python -m http.server 8000"<CR>', opts)
-- Web browser (w3m)
map('n', '<leader>wb', ':TermExec cmd="w3m google.com"<CR>', opts)
-- Comment line/selection
map('n', '<leader>/', ':lua require("Comment.api").toggle.linewise.current()<CR>', opts)
-- Surround (normal mode)
map('n', '<leader>s', '<cmd>lua require("nvim-surround").normal_surround()<CR>', opts)
-- Which-key menu
map('n', '<leader>?', ':WhichKey<CR>', opts)

-- === WHICH-KEY KEYBIND MENU ===
local wk = require('which-key')
wk.register({
  ['<leader>'] = {
    e = 'File explorer',
    ff = 'Find files',
    fg = 'Search text',
    t = 'Floating terminal',
    ws = 'Web server (python)',
    wb = 'Web browser (w3m)',
    cs = 'Change colorscheme',
    ["/"] = 'Comment line',
    s = 'Surround',
    ['?'] = 'Show keybind menu',
  }
})

-- === ALT/SHIFT EASY KEYBINDS ===
-- File explorer
map('n', '<A-e>', ':NvimTreeToggle<CR>', opts)
-- Find files
map('n', '<A-f>', ':Telescope find_files<CR>', opts)
-- Search text
map('n', '<A-g>', ':Telescope live_grep<CR>', opts)
-- Floating terminal
map('n', '<A-t>', ':ToggleTerm direction=float<CR>', opts)
-- Change colorscheme
map('n', '<A-s>', ':lua CycleColorscheme()<CR>', opts)
-- Comment line/selection
map('n', '<A-/>', ':lua require("Comment.api").toggle.linewise.current()<CR>', opts)
-- Surround (normal mode)
map('n', '<A-q>', '<cmd>lua require("nvim-surround").normal_surround()<CR>', opts)
-- Web server
map('n', '<A-w>', ':TermExec cmd="python -m http.server 8000"<CR>', opts)
-- Web browser (w3m)
map('n', '<A-b>', ':TermExec cmd="w3m google.com"<CR>', opts)
-- Which-key menu
map('n', '<A-?>', ':WhichKey<CR>', opts)
-- Save file
map('n', '<A-S>', ':w<CR>', opts)
-- Quit Neovim
map('n', '<A-q>', ':q<CR>', opts)
-- New tab
map('n', '<A-n>', ':tabnew<CR>', opts)
-- Next tab
map('n', '<A-]>', ':tabnext<CR>', opts)
-- Previous tab
map('n', '<A-[>', ':tabprevious<CR>', opts)
-- Split window horizontally
map('n', '<A-h>', ':split<CR>', opts)
-- Split window vertically
map('n', '<A-v>', ':vsplit<CR>', opts)
-- Move to left window
map('n', '<A-Left>', '<C-w>h', opts)
-- Move to right window
map('n', '<A-Right>', '<C-w>l', opts)
-- Move to upper window
map('n', '<A-Up>', '<C-w>k', opts)
-- Move to lower window
map('n', '<A-Down>', '<C-w>j', opts)

-- BASIC OPTIONS
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.signcolumn = 'yes'
vim.o.background = 'dark'
vim.o.cursorline = true

-- Mejorar bordes de ventanas flotantes (opcional, para Gruvbox)
vim.cmd [[
  highlight FloatBorder guifg=#fabd2f guibg=#282828
]]

-- Configuración de contraste suave para Gruvbox
vim.g.gruvbox_contrast_dark = 'soft'

-- LSP & AUTOCOMPLETION
require('mason').setup{}
require('mason-lspconfig').setup{
  ensure_installed = { 'html', 'cssls', 'tsserver', 'pyright', 'lua_ls' },
}
local lspconfig = require('lspconfig')
local servers = { 'html', 'cssls', 'tsserver', 'pyright', 'lua_ls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {}
end

-- Autocompletion
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

-- null-ls for linters/formatters
require('null-ls').setup{}

-- Gitsigns
require('gitsigns').setup{}

-- Comment.nvim
require('Comment').setup{}

-- Which-key
require('which-key').setup{}

-- Autopairs
require('nvim-autopairs').setup{}

-- Surround
require('nvim-surround').setup{}

-- Markdown preview (only for markdown)
vim.g.mkdp_auto_start = 0

-- Set default theme (change with <leader>cs)
vim.cmd [[colorscheme gruvbox]] 