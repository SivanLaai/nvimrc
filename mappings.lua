---@type MappingsTable
local M = {}

M.Spectre = {
  n = {
    -- spectre
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>S"] = { ":lua require('spectre').open()<CR>", "open spectre windows" },
    ["<leader>sw"] = { ":lua require('spectre').open_visual({select_word=true})<CR>", "spectre search current word" },
    ["<leader>sf"] = { ":lua require('spectre').open_file_search({select_word=true})<CR>", "spectre search on current file" },
  },
}
M.Debug = {
  n = {
    ["<F5>"] = { ':lua require("dap").continue()<CR>', "debug: run/continue" },
    ["<F7>"] = { ':lua require("dap").toggle_breakpoint()<CR>', "debug: toggle breakpoint" },
    ["<F8>"] = { ':lua require("dap").terminate() require("dapui").close()<CR>', "debug: stop" },
    ["<F9>"] = { ':lua require("dap").step_into()<CR>', "debug: step into" },
    ["<F10>"] = { ':lua require("dap").step_out()<CR>', "debug: step out" },
    ["<F11>"] = { ':lua require("dap").step_over()<CR>', "debug: step out" },
    ["<leader>db"]= { ':lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', "debug: Set breakpoint with condition" },
    ["<leader>dc"]= { ':lua require("dap").run_to_cursor()<CR>', "debug: run to cursor" },
    ["<leader>dl"]= { ':lua require("dap").run_last()<CR>', "debug: run last" },
    ["<leader>do"]= { ':lua require("dap").repl.open()<CR>', "debug: open REPL" },
  },
}

M.Texlab = {
  n = {
    ["<leader>lc"] = { ":TexlabBuild<CR>", "Texlab: compile tex file" },
    ["<leader>lv"] = { ":TexlabForward<CR>", "Texlab: view latex pdf file" },
  },
}
M.nvterm = {
  plugin = true,

  n = {
    -- new
    ["<leader>h"] = {
      "",
    },

    ["<leader>v"] = {
      "",
    },
  },
}
M.telescope = {

  n = {
    -- new
    ["<leader>fp"] = { ":Telescope projects<CR>", "Telescope: Find Projects"},

  },
}

-- more keybinds!

return M
