-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = require "configs.overrides".lspservers

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}



-- require('texmagic').setup{
--    engines = {

--        pdflatex = {    -- This has the same name as a default engine but would
--                        -- be preferred over the same-name default if defined
--            executable = "latexmk",
--            args = {
--                "-pdflatex",
--                "-interaction=nonstopmode",
--                "-synctex=1",
--                "--output-directory=build",
--                "-bibfudge-",
--                "-pv",
--                "%f"
--            },
--            pdfDirectory = "build",
--            auxDirectory = "build",
--            logDirectory = "build",
--            onSave = false,
-- 		   forwardSearchAfter = false,
--         --    isContinuous = false
--        },
--        lualatex = {    -- This is *not* one of the defaults, but it can be
--                        -- called via magic comment if defined here
--            executable = "latexmk",
--            args = {
--                "-pdflua",
--                "-interaction=nonstopmode",
--                "-synctex=1",
--                "--output-directory=build",
--                "-bibfudge-",
--                "-pv",
--                "%f"
--            },
--            pdfDirectory = "build",
--            auxDirectory = "build",
--            logDirectory = "build",
--            onSave = true,
-- 		--    forwardSearchAfter = true,
--         --    isContinuous = false
--        }
--    }
-- }

-- texlab
lspconfig.texlab.setup({
  cmd = { vim.fn.exepath("texlab") },
  filetypes = {"tex", "bib"},
  on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		texlab = {
      rootDirectory = nil,
      --      ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓
      -- build = _G.TeXMagicBuildConfig,
      build = require("configs.texmagic").engines.pdflatex,
      --      ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑
      --
      ------------------------------- 
			-- build = {
			-- 	executable = "latexmk",
			-- 	--args = { "-pdf", "-interaction=nonstopmode", "-bibfudge-", "-synctex=1", "%f" },
			-- 	args = { "-pdf", "-output-directory=build", "-bibfudge-", "-interaction=nonstopmode", "-synctex=1", "%f" },
      --   pdfDirectory = "build",
      --   auxDirectory = "build",
      --   logDirectory = "build",
			-- 	onSave = true,
			-- 	forwardSearchAfter = true,
			-- },
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
