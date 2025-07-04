-- Keymaps principales estilo NvChad
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- BÁSICAS
map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>n', ':nohlsearch<CR>', opts)
map('n', '<leader>c', ':bd<CR>', opts)
map('n', '<C-s>', ':w<CR>', opts)
map('n', '<C-q>', ':bd<CR>', opts)
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<leader>ch', ':checkhealth<CR>', opts)

-- BUFFER Y TABS
map('n', '<Tab>', ':bnext<CR>', opts)
map('n', '<S-Tab>', ':bprevious<CR>', opts)
map('n', '<leader>bb', ':Telescope buffers<CR>', opts)
map('n', '<leader>bd', ':bd<CR>', opts)

-- TELESCOPE
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
map('n', '<leader>fb', ':Telescope buffers<CR>', opts)
map('n', '<leader>fh', ':Telescope help_tags<CR>', opts)
map('n', '<leader>fo', ':Telescope oldfiles<CR>', opts)

-- LSP
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

-- NVIM-TREE
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>fe', ':NvimTreeFocus<CR>', opts)

-- COMMENT.NVIM
map('n', 'gcc', '<Plug>(comment_toggle_linewise_current)', {})
map('x', 'gc', '<Plug>(comment_toggle_linewise_visual)', {})

-- TERMINAL
map('n', '<C-\\>', ':ToggleTerm<CR>', opts)
-- Salir al modo normal en terminal: esto se hace en la config de toggleterm

-- NOTA: Algunos keybinds como <Tab> y <S-Tab> pueden requerir configuración extra si usas bufferline o plugins de tabs. 