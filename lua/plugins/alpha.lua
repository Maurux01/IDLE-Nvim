-- Configuración de Alpha (dashboard)
local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
[[
                               __                
]],
[[  ____   ____   ____   _____  / /_  ____    _____]],
[[ / __ \ / __ \ / __ \ / ___/ / __/ / __ \  / ___/]],
[[/ /_/ // / / // /_/ // /    / /_  / /_/ / / /    ]],
[[\____//_/ /_/ \____//_/     \__/  \____/ /_/     
]],
}

dashboard.section.buttons.val = {
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
  dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
  dashboard.button("g", "  Find text", ":Telescope live_grep <CR>"),
  dashboard.button("c", "  Config", ":e $MYVIMRC <CR>"),
  dashboard.button("q", "  Quit", ":qa <CR>"),
}

local function footer()
  -- Your footer here
  return "idleNvim"
end

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

alpha.setup(dashboard.opts)
