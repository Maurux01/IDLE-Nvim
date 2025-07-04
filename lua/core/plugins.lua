-- Bootstrap lazy.nvim y cargar plugins
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
  'echasnovski/mini.animate',
  'karb94/neoscroll.nvim',
  'gen740/SmoothCursor.nvim',
  { 'catppuccin/nvim', name = 'catppuccin' },
  'folke/tokyonight.nvim',
  'morhetz/gruvbox',
  'rebelot/kanagawa.nvim',
  'rose-pine/neovim',
  'nyoom-engineering/oxocarbon.nvim',
  'lewis6991/gitsigns.nvim',
  'numToStr/Comment.nvim',
  'windwp/nvim-autopairs',
  'kylechui/nvim-surround',
  'akinsho/toggleterm.nvim',
  'nvim-telescope/telescope.nvim',
  'nvim-lua/plenary.nvim',
  'folke/trouble.nvim',
  'mbbill/undotree',
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
  { 'HiPhish/rainbow-delimiters.nvim' },
})

require('plugins') 