-- Configuración de Mason UI
require('mason').setup {
  ensure_installed = {
    -- formatters
    'prettier',
    'stylua',
  },
  ui = {
    border = 'rounded',
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗'
    }
  }
} 