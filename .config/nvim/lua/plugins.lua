-- Bootstrap lazy.nvim if not installed
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
  -- Color schemes
  'folke/tokyonight.nvim', 'catppuccin/nvim', 'navarasu/onedark.nvim', 'ellisonleao/gruvbox.nvim', 'rose-pine/neovim', 'EdenEast/nightfox.nvim', 'sainnhe/everforest', 'rebelot/kanagawa.nvim', 'Mofiqul/dracula.nvim', 'shaunsingh/nord.nvim', 'ishan9299/nvim-solarized-lua', 'nyoom-engineering/oxocarbon.nvim', 'marko-cerovac/material.nvim', 'bluz71/vim-moonfly-colors', 'projekt0n/github-nvim-theme', 'Mofiqul/vscode.nvim', 'sainnhe/edge', 'Shatur/neovim-ayu', 'sainnhe/sonokai', 'glepnir/zephyr-nvim', 'loctvl842/monokai-pro.nvim', 'EdenEast/nightfox.nvim', 'olivercederborg/poimandres.nvim', 'p00f/alabaster.nvim', 'maxmx03/fluoromachine.nvim', 'tomasiser/vim-code-dark', 'sainnhe/everblush', 'savq/melange-nvim', 'cocopon/iceberg.vim', 'jacoborus/tender.vim', 'NLKNguyen/papercolor-theme', 'marko-cerovac/material.nvim', 'projekt0n/github-nvim-theme', 'uloco/bluloco.nvim', 'rafi/awesome-vim-colorschemes', 'dracula/vim', 'arcticicestudio/nord-vim', 'ayu-theme/ayu-vim', 'morhetz/gruvbox', 'joshdick/onedark.vim', 'sainnhe/gruvbox-material',
  -- UI/UX
  'folke/noice.nvim', 'nvim-lualine/lualine.nvim', 'akinsho/bufferline.nvim', 'goolord/alpha-nvim', 'nvim-tree/nvim-tree.lua', 'nvim-neo-tree/neo-tree.nvim', 'kyazdani42/nvim-web-devicons', 'lukas-reineke/indent-blankline.nvim', 'lewis6991/gitsigns.nvim', 'rcarriga/nvim-notify', 'petertriho/nvim-scrollbar', 'kevinhwang91/nvim-ufo', 'yamatsum/nvim-cursorline', 'kevinhwang91/nvim-hlslens', 'echasnovski/mini.animate',
  -- Keybinds
  'folke/which-key.nvim', 'mrjones2014/legendary.nvim', 'anuvyklack/hydra.nvim',
  -- Productivity
  'nvim-telescope/telescope.nvim', 'nvim-telescope/telescope-fzf-native.nvim', 'nvim-treesitter/nvim-treesitter', 'numToStr/Comment.nvim', 'kylechui/nvim-surround', 'windwp/nvim-autopairs', 'folke/todo-comments.nvim', 'folke/trouble.nvim', 'phaazon/hop.nvim', 'ggandor/leap.nvim', 'ThePrimeagen/harpoon',
  -- LSP/Completion
  'neovim/nvim-lspconfig', 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', 'hrsh7th/nvim-cmp', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip',
  -- IA
  {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_enabled = true
    end
  },
  {
    'Exafunction/codeium.nvim',
    config = function()
      require('codeium').setup({})
    end
  },
  {
    'jackMort/ChatGPT.nvim',
    dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    config = function()
      require('chatgpt').setup({})
    end
  },
}) 