-- Configuración de ToggleTerm
require('toggleterm').setup {
  direction = 'float',
  open_mapping = [[<c-\\]>]],
  start_in_insert = true,
  close_on_exit = true,
  float_opts = {
    border = 'curved',
  },
}
