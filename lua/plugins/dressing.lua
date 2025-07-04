-- Configuración de Dressing.nvim
local status_ok, dressing = pcall(require, "dressing")
if not status_ok then
  return
end

dressing.setup({
  select = {
    backend = { "telescope", "fzf", "builtin" },
  },
})
