---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "ayu_light",
  theme_toggle = { "ayu_light", "ayu_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  -- nvdash (dashboard)
  nvdash = {
    load_on_startup = true,

    header = {
     "                                                        ",
     "                                                        ",
     " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ",
     " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ",
     " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ",
     " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ",
     " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ",
     " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ",
     "                                                        ",
     "                                                        ",
    },

    buttons = {
      { "  Find File", "<leader> f f", "Telescope find_files" },
      { "  Recent Files", "<leader> f o", "Telescope oldfiles" },
      { "  Find Word", "<leader> f w", "Telescope live_grep" },
      { "  Projects", "<leader> f p", "Telescope projects" },
      { "  Bookmarks", "<leader> b m", "Telescope marks" },
      { "  Themes", "<leader> t h", "Telescope themes" },
      { "  Mappings", "<leader> c h", "NvCheatsheet" },
    },

  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
