-- =============================
--      NEOVIM SUPER MODERNO
-- =============================
-- Configuración minimalista, rápida y visualmente atractiva

vim.g.mapleader = " "

-- Bootstrap lazy.nvim
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
  -- UI & Experiencia
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  'folke/which-key.nvim',
  'rcarriga/nvim-notify',
  'stevearc/dressing.nvim',
  'folke/noice.nvim',
  'akinsho/bufferline.nvim',
  'goolord/alpha-nvim',
  'xiyaowong/nvim-transparent',
  -- Animaciones
  'echasnovski/mini.animate',
  'karb94/neoscroll.nvim',
  'gen740/SmoothCursor.nvim',
  -- Color schemes oscuros top
  { 'catppuccin/nvim', name = 'catppuccin' },
  'folke/tokyonight.nvim',
  'morhetz/gruvbox',
  'rebelot/kanagawa.nvim',
  'rose-pine/neovim',
  'nyoom-engineering/oxocarbon.nvim',
  -- Productividad
  'lewis6991/gitsigns.nvim',
  'numToStr/Comment.nvim',
  'windwp/nvim-autopairs',
  'kylechui/nvim-surround',
  'akinsho/toggleterm.nvim',
  'nvim-telescope/telescope.nvim',
  'nvim-lua/plenary.nvim',
  'folke/trouble.nvim',
  'mbbill/undotree',
  -- LSP, Completion, Snippets
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',
})

-- Opciones básicas
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.signcolumn = 'yes'
vim.o.background = 'dark'
vim.o.cursorline = true
vim.o.updatetime = 200
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- Colorscheme oscuro por defecto
vim.cmd [[colorscheme catppuccin]]

-- Treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "bash", "c", "cpp", "css", "dockerfile", "go", "html", "java", "javascript", "json", "lua", "markdown", "php", "python", "ruby", "rust", "sql", "toml", "typescript", "vim", "yaml"
  },
  highlight = { enable = true },
  indent = { enable = true },
}

-- LSP & Mason (solo servidores válidos y funcionales)
require('mason').setup{}
require('mason-lspconfig').setup({
  ensure_installed = {
    'bashls', 'clangd', 'cssls', 'dockerls', 'gopls', 'html', 'jsonls', 'lua_ls', 'marksman', 'pyright', 'solargraph', 'rust_analyzer', 'sqlls', 'taplo', 'vimls', 'yamlls', 'kotlin_language_server', 'texlab', 'lemminx',
  },
  automatic_installation = true,
})
local lspconfig = require('lspconfig')
local servers = {
  'bashls', 'clangd', 'cssls', 'dockerls', 'gopls', 'html', 'jsonls', 'lua_ls', 'marksman', 'pyright', 'solargraph', 'rust_analyzer', 'sqlls', 'taplo', 'vimls', 'yamlls', 'kotlin_language_server', 'texlab', 'lemminx',
}
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
    { name = 'buffer' },
    { name = 'path' },
  }),
})

-- UI Plugins setup
require('lualine').setup{}
require('nvim-tree').setup{}
require('gitsigns').setup{}
require('Comment').setup{}
require('which-key').setup{}
require('nvim-autopairs').setup{}
require('nvim-surround').setup{}
require('toggleterm').setup{}
require('trouble').setup{}
require('noice').setup{}
require('notify').setup{}
require('dressing').setup{}
require('bufferline').setup{}
require('alpha').setup(require'alpha.themes.startify'.config)
require('SmoothCursor').setup{}
require('transparent').setup({ enable = true })
require('mini.animate').setup({
  timing = require('mini.animate').gen_timing.sine({ duration = 300 }),
  cursor = { enable = true, timing = require('mini.animate').gen_timing.sine({ duration = 200 }) },
  scroll = { enable = true, timing = require('mini.animate').gen_timing.sine({ duration = 300 }) },
  resize = { enable = true, timing = require('mini.animate').gen_timing.sine({ duration = 180 }) },
  open = { enable = true, timing = require('mini.animate').gen_timing.sine({ duration = 120 }) },
  close = { enable = true, timing = require('mini.animate').gen_timing.sine({ duration = 100 }) },
})
require('neoscroll').setup({
  easing_function = 'sine',
  hide_cursor = true,
  stop_eof = true,
  respect_scrolloff = true,
  cursor_scrolls_alone = true,
  performance_mode = false,
  pre_hook = nil,
  post_hook = nil,
})

-- Keybinds esenciales
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>tt', ':ToggleTerm<CR>', opts)
map('n', '<leader>/', ':lua require("Comment.api").toggle.linewise.current()<CR>', opts)
map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>n', ':enew<CR>', opts)
map('n', '<S-l>', ':bnext<CR>', opts)
map('n', '<S-h>', ':bprevious<CR>', opts)
map('n', '<leader>u', ':UndotreeToggle<CR>', opts)
map('n', '<leader>h', ':nohlsearch<CR>', opts)
map('n', '<leader>?', ':WhichKey<CR>', opts)

-- Dashboard de bienvenida
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local ascii = {
      " _   _      _    ___ ___ __  __ ",
      "| \ | |    | |  |_ _|_ _|  \/  |",
      "|  \| | ___| |_  | | | || |\/| |",
      "| . ` |/ _ \ __| | | | || |  | |",
      "| |\  |  __/ |_ |___|___|_|  |_||",
      "|_| \_|\___|\__|                   ",
    }
    vim.api.nvim_buf_set_lines(0, 0, -1, false, ascii)
    vim.api.nvim_command('normal! G')
  end
}) 