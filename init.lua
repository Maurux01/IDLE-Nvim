-- =============================
--      NEOVIM IDE SETUP
-- =============================
-- Modern IDE-like config with lazy.nvim, LSP, autocompletion, VSCode-like UI, animations, and all major languages

-- 1. Set <leader> to '/'
vim.g.mapleader = "/"

-- 2. Bootstrap lazy.nvim
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

-- 3. Plugin setup (all-in-one)
require('lazy').setup({
  -- UI & Experience
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  'lukas-reineke/indent-blankline.nvim',
  'folke/which-key.nvim',
  'rcarriga/nvim-notify',
  'stevearc/dressing.nvim',
  'folke/noice.nvim',
  'petertriho/nvim-scrollbar',
  'karb94/neoscroll.nvim',
  -- Animations
  'echasnovski/mini.animate',
  -- Color schemes
  { 'catppuccin/nvim', name = 'catppuccin' },
  'folke/tokyonight.nvim',
  'morhetz/gruvbox',
  { 'dracula/vim', name = 'dracula' },
  'shaunsingh/nord.nvim',
  'navarasu/onedark.nvim',
  'EdenEast/nightfox.nvim',
  'Mofiqul/vscode.nvim',
  'sainnhe/everforest',
  'rebelot/kanagawa.nvim',
  'rose-pine/neovim',
  -- Productivity
  'lewis6991/gitsigns.nvim',
  'numToStr/Comment.nvim',
  'windwp/nvim-autopairs',
  'kylechui/nvim-surround',
  'akinsho/toggleterm.nvim',
  'nvim-telescope/telescope.nvim',
  'nvim-lua/plenary.nvim',
  'folke/trouble.nvim',
  'mbbill/undotree',
  'ThePrimeagen/harpoon',
  -- LSP, Completion, Snippets
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',
  'jose-elias-alvarez/null-ls.nvim',
  -- DAP (Debugging)
  'mfussenegger/nvim-dap',
  'rcarriga/nvim-dap-ui',
  'theHamsta/nvim-dap-virtual-text',
  -- Markdown/Docs
  { 'iamcco/markdown-preview.nvim', build = 'cd app && npm install', ft = 'markdown' },
  -- AI
  { 'Exafunction/codeium.nvim', dependencies = { 'nvim-lua/plenary.nvim', 'hrsh7th/nvim-cmp' } },
})

-- 4. Basic options for modern look
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

-- 5. Colorscheme (default: vscode)
vim.cmd [[colorscheme vscode]]

-- 6. Treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "bash", "c", "cpp", "css", "dockerfile", "go", "html", "java", "javascript", "json", "lua", "markdown", "php", "python", "ruby", "rust", "sql", "toml", "typescript", "vim", "yaml", "kotlin", "dart", "swift", "latex", "xml", "svelte", "vue"
  },
  highlight = { enable = true },
  indent = { enable = true },
}

-- 7. LSP & Mason
require('mason').setup{}
require('mason-lspconfig').setup{
  ensure_installed = {
    'bashls', 'clangd', 'cssls', 'dockerls', 'gopls', 'html', 'jdtls', 'tsserver', 'jsonls', 'lua_ls', 'marksman', 'phpactor', 'pyright', 'ruby_ls', 'rust_analyzer', 'sqlls', 'taplo', 'vimls', 'yamlls', 'kotlin_language_server', 'dartls', 'swift_mesonls', 'texlab', 'lemminx', 'volar', 'svelte',
  },
}
local lspconfig = require('lspconfig')
local servers = {
  'bashls', 'clangd', 'cssls', 'dockerls', 'gopls', 'html', 'jdtls', 'tsserver', 'jsonls', 'lua_ls', 'marksman', 'phpactor', 'pyright', 'ruby_ls', 'rust_analyzer', 'sqlls', 'taplo', 'vimls', 'yamlls', 'kotlin_language_server', 'dartls', 'swift_mesonls', 'texlab', 'lemminx', 'volar', 'svelte',
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {}
end

-- 8. Autocompletion
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

-- 9. UI Plugins setup (lualine, nvim-tree, etc)
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
require('scrollbar').setup{}
require('mini.animate').setup{}
require('neoscroll').setup{}

-- 10. Keybinds (Vim style, leader is /)
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', '<leader>ff', ':Telescope find_files<CR>', opts) -- /ff: Find files
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)  -- /fg: Grep
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)        -- /e: File explorer
map('n', '<leader>t', ':ToggleTerm<CR>', opts)            -- /t: Terminal
map('n', '<leader>/', ':lua require("Comment.api").toggle.linewise.current()<CR>', opts) -- //: Comment
map('n', '<leader>b', ':Telescope buffers<CR>', opts)     -- /b: Buffers
map('n', '<leader>gs', ':Gitsigns stage_hunk<CR>', opts)  -- /gs: Git stage
map('n', '<leader>gu', ':Gitsigns undo_stage_hunk<CR>', opts) -- /gu: Git undo stage
map('n', '<leader>gd', ':Gitsigns diffthis<CR>', opts)    -- /gd: Git diff
map('n', '<leader>u', ':UndotreeToggle<CR>', opts)        -- /u: Undo tree
map('n', '<leader>h', ':nohlsearch<CR>', opts)            -- /h: Clear search
map('n', '<leader>q', ':q<CR>', opts)                     -- /q: Quit
map('n', '<leader>w', ':w<CR>', opts)                     -- /w: Save
map('n', '<leader>n', ':enew<CR>', opts)                  -- /n: New file
map('n', '<leader>[', ':bprevious<CR>', opts)             -- /[: Prev buffer
map('n', '<leader>]', ':bnext<CR>', opts)                 -- /]: Next buffer
map('n', '<leader>s', ':lua require("nvim-surround").normal_surround()<CR>', opts) -- /s: Surround
map('n', '<leader>?', ':WhichKey<CR>', opts)              -- /?: Which-key
map('n', '<leader>cs', ':lua CycleColorscheme()<CR>', opts) -- /cs: Cycle colorscheme

-- 11. Colorscheme rotator
local colorschemes = {
  'vscode', 'catppuccin', 'tokyonight', 'gruvbox', 'dracula', 'nord', 'onedark', 'nightfox', 'everforest', 'kanagawa', 'rose-pine',
}
local cs_index = 1
function _G.CycleColorscheme()
  cs_index = cs_index % #colorschemes + 1
  vim.cmd('colorscheme ' .. colorschemes[cs_index])
  print('Colorscheme: ' .. colorschemes[cs_index])
end

-- 12. Markdown preview config
vim.g.mkdp_auto_start = 0

-- 13. AI (Codeium)
require("codeium").setup({}) 