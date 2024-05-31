local overrides = require("configs.overrides")
return {
  {
    lazy = false,
    "equalsraf/neovim-gui-shim"
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
    -- Latex
  {
    lazy = false,
    "lervag/vimtex",
    init = function()
      require("configs.vimtex")
    end,
  },
  {
    lazy = false,
    "jakewvincent/texmagic.nvim",
    init = function()
      require("configs.texmagic")
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  
  {
  	"williamboman/mason.nvim",
    opts = overrides.mason,
  	-- opts = {
  	-- 	ensure_installed = {
  	-- 		"lua-language-server", "stylua",
  	-- 		"html-lsp", "css-lsp" , "prettier"
  	-- 	},
  	-- },
  },
   {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  }, 
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
    -- Spectre Replace and Find
  {
    lazy = true,
    "nvim-pack/nvim-spectre",
    dependencies = {
      {
        "nvim-lua/plenary.nvim",
      },
    },
    opts = function()
      return require("configs.spectre")
    end,
    config = function(_, opts)
      require("spectre").setup(opts)
      -- require "custom.configs.spectre"
    end,
  },
  --   -- Uncomment if you want to re-enable which-key
  -- {
  --   "folke/which-key.nvim",
  --   enabled = true,
  -- },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
    -- Project Management
  {
    lazy = false,
    "ahmedkhalf/project.nvim",
    opts = function()
      return require("configs.project")
    end,
    dependencies = {
      {
        "nvim-tree/nvim-tree.lua",
        opts = function()
          return require("configs.nvimtree")
        end,
        config = function(_, opts)
          return require("nvim-tree").setup(opts)
        end,
      },
    },
    config = function(_, opts)
      require("project_nvim").setup(opts)
    end,
  },
    -- term
  -- {
  --   "NvChad/nvterm",
  --   init = require("core.utils").load_mappings "nvterm",
  --   opts = function()
  --     return require("configs.nvterm")
  --   end,
  --   config = function(_, opts)
  --     require "base46.term"
  --     require("nvterm").setup(opts)
  --   end,
  -- },
    -- Debug 
  -- {
  --   lazy = false,
  --   "rcarriga/nvim-dap-ui",
  --   dependencies = {
  --     {
  --       "mfussenegger/nvim-dap",
  --       config = function()
  --         require("custom.configs.dap.init")
  --       end,
  --     },
  --   },
    -- Transparent
  -- {
  --   lazy = false,
  --   "tribela/vim-transparent",
  -- },
}
