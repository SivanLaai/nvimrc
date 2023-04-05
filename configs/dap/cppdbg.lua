local dap  = require("dap")
local function isempty(s)
	return s == nil or s == ""
end
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/home/ccip/.local/share/nvim/mason/bin/OpenDebugAD7',
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    args = function()
      return {vim.fn.input('Parameters to executable: ', vim.fn.getcwd() .. '/', 'file')}
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    args = function()
      return {vim.fn.input('Parameters to executable: ', vim.fn.getcwd() .. '/', 'file')}
    end,
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}
