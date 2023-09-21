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
