-- Configuración de nvim-treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "bash", "c", "cpp", "css", "dockerfile", "go", "html", "java", "javascript", "json", "lua", "markdown", "php", "python", "ruby", "rust", "sql", "toml", "typescript", "vim", "yaml", "vue", "svelte"
  },
  highlight = { enable = true },
  indent = { enable = true },
  rainbow = { enable = true, extended_mode = true },
} 