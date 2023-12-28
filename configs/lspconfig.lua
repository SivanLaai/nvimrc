local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "pyright", "clangd"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { vim.fn.exepath(lsp) }
  }
end

lspconfig.texlab.setup({
  cmd = { vim.fn.exepath("texlab") },
  filetypes = {"tex", "bib"},
  on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		texlab = {
      rootDirectory = nil,
      --      ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓
      --build = _G.TeXMagicBuildConfig,
      --      ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑
      --
      ------------------------------- 
			build = {
				executable = "latexmk",
				--args = { "-pdf", "-interaction=nonstopmode", "-bibfudge-", "-synctex=1", "%f" },
				args = { "-pdf", "-output-directory=build", "-bibfudge-", "-interaction=nonstopmode", "-synctex=1", "%f" },
        pdfDirectory = "build",
        auxDirectory = "build",
        logDirectory = "build",
				onSave = true,
				forwardSearchAfter = true,
			},
			chktex = {
				onOpenAndSave = true,
			},
			forwardSearch = {
				executable = "D:\\Program Files\\SumatraPDF\\SumatraPDF.exe",
				args = {"-reuse-instance", "-forward-search", "%f", "%l", "%p" },
			},
		},
	},
})


lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { vim.fn.exepath("lua_ls") },
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end
}
