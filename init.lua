-- =============================
--      NEOVIM IDE SETUP
-- =============================
-- Modern IDE-like config with lazy.nvim, LSP, autocompletion, VSCode-like UI, animations, and all major languages

-- 1. Set <leader> to ' ' (space, estilo NvChad)
vim.g.mapleader = " "

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
  'nvimtools/none-ls.nvim',
  -- DAP (Debugging)
  'mfussenegger/nvim-dap',
  'rcarriga/nvim-dap-ui',
  'theHamsta/nvim-dap-virtual-text',
  -- Markdown/Docs
  { 'iamcco/markdown-preview.nvim', build = 'cd app && npm install', ft = 'markdown' },
  -- AI
  { 'Exafunction/codeium.nvim', dependencies = { 'nvim-lua/plenary.nvim', 'hrsh7th/nvim-cmp' } },
  -- Rainbow brackets
  { 'HiPhish/rainbow-delimiters.nvim' },
  -- Más color schemes modernos
  'oxfist/night-owl.nvim',
  'projekt0n/github-nvim-theme',
  'sainnhe/sonokai',
  'sainnhe/edge',
  'nyoom-engineering/oxocarbon.nvim',
  'Yazeed1s/oh-lucy.nvim',
  'ramojus/mellifluous.nvim',
  'tiagovla/tokyodark.nvim',
  'olimorris/onedarkpro.nvim',
  'maxmx03/fluoromachine.nvim',
  -- UI/UX
  'akinsho/bufferline.nvim',
  'goolord/alpha-nvim',
  -- Animaciones y extras visuales
  'gen740/SmoothCursor.nvim',
  'xiyaowong/nvim-transparent',
  'RRethy/vim-illuminate',
  'folke/zen-mode.nvim',
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
vim.cmd [[colorscheme catppuccin]]

-- 6. Treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "bash", "c", "cpp", "css", "dockerfile", "go", "html", "java", "javascript", "json", "lua", "markdown", "php", "python", "ruby", "rust", "sql", "toml", "typescript", "vim", "yaml", "kotlin", "dart", "swift", "latex", "xml", "svelte", "vue"
  },
  highlight = { enable = true },
  indent = { enable = true },
}

-- Rainbow brackets config
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

-- 10. Keybinds (estilo NvChad, líder es <Space>)
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- === Archivos y búsqueda ===
map('n', '<leader>ff', ':Telescope find_files<CR>', opts) -- Buscar archivos
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts) -- Buscar texto en proyecto
map('n', '<leader>fb', ':Telescope buffers<CR>', opts)   -- Buscar buffers abiertos
map('n', '<leader>fo', ':Telescope oldfiles<CR>', opts)  -- Archivos recientes
-- === Explorador y terminal ===
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)       -- Explorador de archivos
map('n', '<leader>tt', ':ToggleTerm<CR>', opts)          -- Terminal flotante
-- === Comentarios y surround ===
map('n', '<leader>/', ':lua require("Comment.api").toggle.linewise.current()<CR>', opts) -- Comentar línea actual
map('n', '<leader>s', ':lua require("nvim-surround").normal_surround()<CR>', opts) -- Surround (añadir/editar delimitadores)
-- === Guardar, cerrar, nuevo buffer ===
map('n', '<leader>w', ':w<CR>', opts)                    -- Guardar archivo
map('n', '<leader>q', ':q<CR>', opts)                    -- Cerrar ventana
map('n', '<leader>n', ':enew<CR>', opts)                 -- Nuevo buffer vacío
-- === Navegación de buffers ===
map('n', '<S-l>', ':bnext<CR>', opts)                    -- Siguiente buffer
map('n', '<S-h>', ':bprevious<CR>', opts)                -- Buffer anterior
-- === Git ===
map('n', '<leader>gg', ':LazyGit<CR>', opts)             -- LazyGit (si está instalado)
map('n', '<leader>gs', ':Gitsigns stage_hunk<CR>', opts)  -- Git: stage hunk
map('n', '<leader>gu', ':Gitsigns undo_stage_hunk<CR>', opts) -- Git: undo stage hunk
map('n', '<leader>gd', ':Gitsigns diffthis<CR>', opts)    -- Git: diff actual
-- === Ventanas y splits ===
map('n', '<leader>sv', ':vsplit<CR>', opts)               -- Split vertical
map('n', '<leader>sh', ':split<CR>', opts)                -- Split horizontal
map('n', '<C-h>', '<C-w>h', opts)                         -- Mover a ventana izquierda
map('n', '<C-j>', '<C-w>j', opts)                         -- Mover a ventana abajo
map('n', '<C-k>', '<C-w>k', opts)                         -- Mover a ventana arriba
map('n', '<C-l>', '<C-w>l', opts)                         -- Mover a ventana derecha
-- === Utilidades ===
map('n', '<leader>u', ':UndotreeToggle<CR>', opts)        -- Árbol de deshacer
map('n', '<leader>h', ':nohlsearch<CR>', opts)            -- Limpiar resaltado de búsqueda
map('n', '<leader>?', ':WhichKey<CR>', opts)              -- Mostrar menú de atajos (<leader> + ?)
map('n', '<leader>cs', ':lua CycleColorscheme()<CR>', opts) -- Cambiar esquema de color

-- === Keybinds estilo NvChad (Alt) ===
map('n', '<A-e>', ':NvimTreeToggle<CR>', opts)
map('n', '<A-f>', ':Telescope find_files<CR>', opts)
map('n', '<A-g>', ':Telescope live_grep<CR>', opts)
map('n', '<A-t>', ':ToggleTerm<CR>', opts)
map('n', '<A-s>', ':lua CycleColorscheme()<CR>', opts)
map('n', '<A-/>', ':lua require("Comment.api").toggle.linewise.current()<CR>', opts)
map('n', '<A-q>', ':lua require("nvim-surround").normal_surround()<CR>', opts)
map('n', '<A-w>', ':!python3 -m http.server 8000<CR>', opts)
map('n', '<A-b>', ':!w3m google.com<CR>', opts)
map('n', '<A-?>', ':WhichKey<CR>', opts)
map('n', '<A-S>', ':w<CR>', opts)
map('n', '<A-n>', ':tabnew<CR>', opts)
map('n', '<A-]>', ':tabnext<CR>', opts)
map('n', '<A-[>', ':tabprevious<CR>', opts)
map('n', '<A-h>', ':split<CR>', opts)
map('n', '<A-v>', ':vsplit<CR>', opts)
map('n', '<A-Left>', '<C-w>h', opts)
map('n', '<A-Right>', '<C-w>l', opts)
map('n', '<A-Up>', '<C-w>k', opts)
map('n', '<A-Down>', '<C-w>j', opts)

-- 11. Colorscheme rotator
local colorschemes = {
  'vscode', 'catppuccin', 'tokyonight', 'gruvbox', 'dracula', 'nord', 'onedark', 'nightfox', 'everforest', 'kanagawa', 'rose-pine',
  'night-owl', 'github_dark', 'sonokai', 'edge', 'oxocarbon', 'oh-lucy', 'mellifluous', 'tokyodark', 'onedarkpro', 'fluoromachine',
}
local cs_index = 1
function _G.CycleColorscheme()
  cs_index = cs_index % #colorschemes + 1
  local cs = colorschemes[cs_index]
  vim.cmd('colorscheme ' .. cs)
  local ok, notify = pcall(require, 'notify')
  if ok then
    notify('🌈 Colorscheme: ' .. cs, 'info', { title = 'Colorscheme Rotator', timeout = 2000 })
  else
    print('Colorscheme: ' .. cs)
  end
end

-- 12. Markdown preview config
vim.g.mkdp_auto_start = 0

-- 13. AI (Codeium)
require("codeium").setup({})

-- Mostrar ASCII art de bienvenida solo con el texto N-VIM
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local ascii = {
      " _   _      _    ___ ___ __  __ ",
      "| \\ | |    | |  |_ _|_ _|  \\/  |",
      "|  \\| | ___| |_  | | | || |\\/| |",
      "| . ` |/ _ \\ __| | | | || |  | |",
      "| |\\  |  __/ |_ |___|___|_|  |_||",
      "|_| \\_|\\___|\\__|                   ",
    }
    vim.api.nvim_buf_set_lines(0, 0, -1, false, ascii)
    vim.api.nvim_command('normal! G')
  end
})

-- Configuración de plugins UI/UX y animaciones extra
require('bufferline').setup{}
require('alpha').setup(require'alpha.themes.startify'.config)
require('SmoothCursor').setup{}
require('transparent').setup({ enable = true })
require('illuminate').configure({ delay = 200 })
require('zen-mode').setup{} 