-- Keymaps principales
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
map('n', '<leader>fb', ':Telescope buffers<CR>', opts)
map('n', '<leader>fo', ':Telescope oldfiles<CR>', opts)
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>tt', ':ToggleTerm<CR>', opts)
map('n', '<leader>/', ':lua require("Comment.api").toggle.linewise.current()<CR>', opts)
map('n', '<leader>s', ':lua require("nvim-surround").normal_surround()<CR>', opts)
map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>n', ':enew<CR>', opts)
map('n', '<S-l>', ':bnext<CR>', opts)
map('n', '<S-h>', ':bprevious<CR>', opts)
map('n', '<leader>u', ':UndotreeToggle<CR>', opts)
map('n', '<leader>h', ':nohlsearch<CR>', opts)
map('n', '<leader>?', ':WhichKey<CR>', opts) 