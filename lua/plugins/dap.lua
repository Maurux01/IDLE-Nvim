-- Configuración del depurador nvim-dap
local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

-- Iconos para la interfaz del depurador
dap.defaults.fallback.terminal_win_opts.border = "rounded"
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticInfo", linehl = "", numhl = "" })

-- NOTA: La configuración de adaptadores (para cada lenguaje) se suele hacer
-- en la configuración del LSP de cada lenguaje o en un archivo dedicado.
-- Por ahora, esta es la configuración base.
