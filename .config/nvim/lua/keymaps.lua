vim.g.mapleader = ' '
local wk = require('which-key')
wk.register({
  c = {
    name = 'Colors/Copilot',
    s = { '<cmd>ColorSchemeSwitch<CR>', 'Switch Colorscheme' },
    c = { '<cmd>lua require("ia").toggle_copilot()<CR>', 'Toggle Copilot' },
  },
  a = {
    name = 'AI',
    i = { ':ChatGPTEditWithInstructions<CR>', 'Edit with AI (ChatGPT)' },
  },
}, { prefix = '<leader>' }) 