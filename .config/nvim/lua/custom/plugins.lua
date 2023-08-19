local overrides = require "custom.configs.overrides"

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

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

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
  {
    "NvChad/nvim-colorizer.lua",
    enabled = true,
  },

  -- Uncomment if you want to re-enable which-key
  {
    "rafamadriz/friendly-snippets",
    enabled = false,
  },

  {
    "Exafunction/codeium.vim",
    enabled = false,
    lazy = false,
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      -- vim.keymap.set("i", "<C-g>", function()
      --   return vim.fn["codeium#Accept"]()
      -- end, { expr = true })
      -- vim.keymap.set("i", "<c-;>", function()
      --   return vim.fn["codeium#CycleCompletions"](1)
      -- end, { expr = true })
      -- vim.keymap.set("i", "<c-,>", function()
      --   return vim.fn["codeium#CycleCompletions"](-1)
      -- end, { expr = true })
      -- vim.keymap.set("i", "<c-x>", function()
      --   return vim.fn["codeium#Clear"]()
      -- end, { expr = true })
    end,
  },
}

return plugins
