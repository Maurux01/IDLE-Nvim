require('mason').setup {}
require('mason-lspconfig').setup {}
local lspconfig = require('lspconfig')
local servers = { 'pyright', 'tsserver', 'lua_ls', 'bashls', 'jsonls', 'yamlls', 'gopls', 'clangd', 'rust_analyzer' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
  }
end

-- nvim-cmp setup
local cmp = require('cmp')
local luasnip = require('luasnip')
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm { select = true },
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' },
  },
} 