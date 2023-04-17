local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- Uncomment if you want to re-enable which-key
  {
    "folke/which-key.nvim",
    enabled = true,
  },
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
      return require("custom.configs.spectre")
    end,
    config = function(_, opts)
      require("spectre").setup(opts)
      -- require "custom.configs.spectre"
    end,
  },
  -- term
  {
    "NvChad/nvterm",
    init = require("core.utils").load_mappings "nvterm",
    opts = function()
      return require("custom.configs.nvterm")
    end,
    config = function(_, opts)
      require "base46.term"
      require("nvterm").setup(opts)
    end,
  },
  -- Debug 
  {
    lazy = false,
    "rcarriga/nvim-dap-ui",
    dependencies = {
      {
        "mfussenegger/nvim-dap",
        config = function()
          return require("custom.configs.dap.init")
        end,
      },
    },
  },
  -- Latex
  {
    lazy = false,
    "lervag/vimtex",
    init = function()
      require("custom.configs.vimtex")
    end,
  },
  -- Project Management
  {
    lazy = false,
    "ahmedkhalf/project.nvim",
    opts = function()
      return require("custom.configs.project")
    end,
    dependencies = {
      {
        "nvim-tree/nvim-tree.lua",
        opts = function()
          return require("custom.configs.nvimtree")
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

}

return plugins
