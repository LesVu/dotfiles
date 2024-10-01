local overrides = require "configs.overrides"

return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
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
