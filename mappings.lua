---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>S"] = { ":lua require('spectre').open()<CR>", "open spectre windows" },
    ["<leader>sw"] = { ":lua require('spectre').open_visual({select_word=true})<CR>", "spectre search current word" },
    ["<leader>sf"] = { ":lua require('spectre').open_file_search({select_word=true})<CR>", "spectre search on current file" },
  },
}

-- more keybinds!

return M
