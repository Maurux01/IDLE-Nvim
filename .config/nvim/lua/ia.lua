-- Copilot always on, toggle with <leader>cc
vim.g.copilot_enabled = true
vim.api.nvim_set_keymap('n', '<leader>cc', ":lua require('ia').toggle_copilot()<CR>", { noremap = true, silent = true, desc = 'Toggle Copilot' })

function _G.require('ia').toggle_copilot()
  vim.g.copilot_enabled = not vim.g.copilot_enabled
  if vim.g.copilot_enabled then
    vim.cmd('Copilot enable')
    vim.notify('Copilot enabled', vim.log.levels.INFO)
  else
    vim.cmd('Copilot disable')
    vim.notify('Copilot disabled', vim.log.levels.WARN)
  end
end

-- Codeium (auto enabled if installed)
-- No toggle by default, but you can add one if you want

-- ChatGPT.nvim example keybinds
vim.keymap.set('v', '<leader>ai', ':ChatGPTEditWithInstructions<CR>', { desc = 'Edit with AI (ChatGPT)' })

-- Usage example:
-- 1. Select code in visual mode
-- 2. Press <leader>ai
-- 3. Escribe la instrucción ("Refactor", "Explain", "Delete", "Insert a function", etc)
-- 4. La IA editará el código seleccionado 