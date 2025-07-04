-- Configuración de Mason y LSP para frontend y backend

require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver', 'html', 'cssls', 'jsonls', 'vuels', 'svelte',
    'pyright', 'gopls', 'rust_analyzer', 'phpactor', 'lua_ls', 'dockerls', 'bashls'
  },
  automatic_installation = true,
})

local lspconfig = require('lspconfig')
local servers = {
  'tsserver', 'html', 'cssls', 'jsonls', 'vuels', 'svelte',
  'pyright', 'gopls', 'rust_analyzer', 'phpactor', 'lua_ls', 'dockerls', 'bashls'
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {}
end

-- Autocompletion
local cmp = require'cmp'
local luasnip = require'luasnip'
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  }),
}) 