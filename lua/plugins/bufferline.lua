-- Configuración de Bufferline
require('bufferline').setup {
  options = {
    mode = "buffers",
    separator_style = 'thin',
    always_show_bufferline = true,
    show_buffer_close_icons = true,
    show_close_icon = '',
    color_icons = true,
    diagnostics = "nvim_lsp",
  },
}
