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
    name = "Debug Run",
    type = "cppdbg",
    request = "launch",
    program = function()
      return "/home/ccip/anaconda3/bin/python" --'Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    args = function()
      return {"/home/ccip/.data/dreamplace/Placer.py","/home/ccip/.data/test/ispd2005/lpabs/adaptec1.json"}
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = false,
    setupCommands = {
      {
         text = '-enable-pretty-printing',
         description =  'enable pretty printing',
         ignoreFailures = true,
      },
    },
  },
  {
    name = "Launch program",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Executable Path: ', vim.fn.getcwd() .. '/', 'file')
    end,
    args = function()
      return {vim.fn.input('Parameters1: ', ''), vim.fn.input('Parameters2: ', '')}
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = false,
    setupCommands = {
      {
         text = '-enable-pretty-printing',
         description =  'enable pretty printing',
         ignoreFailures = true,
      },
    },
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
      return {vim.fn.input('Parameters: ', '')}
    end,
    program = function()
      return {vim.fn.input('Executable Path: ', vim.fn.getcwd() .. '/', 'file')}
    end,
    setupCommands = {
      {
         text = '-enable-pretty-printing',
         description =  'enable pretty printing',
         ignoreFailures = true,
      },
    },
  },
}
