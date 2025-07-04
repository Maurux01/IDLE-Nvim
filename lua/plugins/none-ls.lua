-- Configuración de none-ls para formateo y linting
local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

null_ls.setup({
  sources = {
    -- Formatters
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,

    -- Linters (opcional, puedes añadir más)
    -- null_ls.builtins.diagnostics.eslint_d,
  },
  -- Configurar formateo automático al guardar
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = "LspFormat", buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = "LspFormat",
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, async = true })
        end,
      })
    end
  end,
})
