---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>S"] = { ":Spectre <CR>", "open replace windows" },
  },
}

-- more keybinds!

return M
