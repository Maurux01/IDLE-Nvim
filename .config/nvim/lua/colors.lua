local themes = {
  'tokyonight', 'catppuccin', 'onedark', 'gruvbox', 'rose-pine', 'nightfox', 'everforest', 'kanagawa', 'dracula', 'nord', 'solarized', 'oxocarbon', 'material', 'moonfly', 'github-theme', 'vscode', 'edge', 'ayu', 'sonokai', 'zephyr', 'monokai-pro', 'carbonfox', 'palenight', 'alabaster', 'fluoromachine', 'synthwave84', 'night-owl', 'everblush', 'melange', 'iceberg', 'tender', 'papercolor', 'material-darker', 'github-colors', 'bluloco', 'cobalt2', 'horizon', 'sourcerer', 'space-vim-dark', 'gotham256', 'apprentice', 'oceanic-next', 'base16', 'vim-atom-dark', 'vim-monokai-tasty', 'vim-ayu', 'vim-code-dark', 'vim-colors-xcode', 'vim-deus', 'vim-gruvbox8', 'vim-material', 'vim-moonfly-colors', 'vim-one', 'vim-palenight', 'vim-snazzy', 'vim-wombat256mod', 'zenburn',
}

local function set_colorscheme(name)
  vim.cmd('colorscheme ' .. name)
end

vim.api.nvim_create_user_command('ColorSchemeSwitch', function()
  vim.ui.select(themes, { prompt = 'Select colorscheme:' }, function(choice)
    if choice then set_colorscheme(choice) end
  end)
end, {})

vim.keymap.set('n', '<leader>cs', ':ColorSchemeSwitch<CR>', { desc = 'Switch colorscheme' })

-- Set default colorscheme
set_colorscheme('tokyonight') 