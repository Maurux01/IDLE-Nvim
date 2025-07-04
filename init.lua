vim.g.mapleader = ' '

-- =============================
--      NEOVIM IDE MODERNO
-- =============================
-- Configuración modular para frontend y backend
-- Estructura: lua/core/* y lua/plugins/*

-- Opciones básicas y atajos
require('core.options')
require('core.keymaps')

-- Plugins y configuración modular
local ok, _ = pcall(require, 'core.plugins')
if not ok then
  vim.notify('Error cargando core.plugins', vim.log.levels.ERROR)
end

-- Cargar configuración de plugins (si existe)
local has_plugins, _ = pcall(require, 'plugins')
if not has_plugins then
  vim.notify('No se encontró lua/plugins/init.lua', vim.log.levels.WARN)
end

-- Mensaje de bienvenida personalizado
vim.schedule(function()
  print('✨ Neovim IDE listo para frontend y backend!')
end) 