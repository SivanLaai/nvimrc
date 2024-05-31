require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")



-- spectre
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>S", ":lua require('spectre').open()<CR>", { desc = "Spectre open windows" })
map("n", "<leader>sw", ":lua require('spectre').open_visual({select_word=true})<CR>", { desc = "Spectre search current word" })
map("n", "<leader>sf", ":lua require('spectre').open_file_search({select_word=true})<CR>", { desc = "Spectre search on current file" })

-- Debug
-- map("n", "<F5>", ":lua require("dap").continue()<CR>", { desc = "debug run/continue" })
-- map("n", "<F7>", ":lua require("dap").toggle_breakpoint()<CR>", { desc = "debug run/continue" })
-- map("n", "<F8>", ":lua require("dap").terminate() require("dapui").close()<CR>", { desc = "debug stop" })
-- map("n", "<F9>", ":lua require("dap").step_into()<CR>", { desc = "debug step into" })
-- map("n", "<F10>", ":lua require("dap").step_out()<CR>", { desc = "debug step out" })
-- map("n", "<F11>", ":lua require("dap").step_over()<CR>", { desc = "debug step over" })
-- map("n", "<leader>db", ":lua require('spectre').set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>", { desc = "debug Set breakpoint with condition" })
-- map("n", "<leader>dc", ":lua require("dap").run_to_cursor()<CR>", { desc = "debug run to cursor" })
-- map("n", "<leader>dl", ":lua require("dap").run_last()<CR>", { desc = "debug run last" })
-- map("n", "<leader>do", ":lua require("dap").repl.open()<CR>", { desc = "debug open REPL" })

-- Texlab
map("n", "<leader>lc", ":TexlabBuild<CR>", { desc = "Texlab compile tex file" })
map("n", "<leader>lv", ":TexlabForward<CR>", { desc = "Texlab view latex pdf file" })

-- M.nvterm = {
--   plugin = true,

--   n = {
--     -- new
--     ["<leader>h"] = {
--       "",
--     },

--     ["<leader>v"] = {
--       "",
--     },
--   },
-- }

-- telescope
map("n", "<leader>fp", ":Telescope projects<CR>", { desc = "Telescope find projects" })
