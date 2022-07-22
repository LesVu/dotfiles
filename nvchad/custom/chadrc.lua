-- Just an example, supposed to be placed in /lua/custom/

local M = {}

local override = require "custom.override"

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "palenight",
}

M.plugins = {
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
   override = {
      ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
      ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
   },
   user = require "custom.plugins",
}
return M

-- M.options = {
--    -- load your options here or load module with options
--    user = function() end,
--
--    nvChad = {
--       update_url = "https://github.com/NvChad/NvChad",
--       update_branch = "main",
--    },
-- }
--
-- M.ui = {
--    -- hl = highlights
--    hl_add = {},
--    hl_override = {},
--    changed_themes = {},
--    theme_toggle = { "onedark", "one_light" },
--    theme = "onedark", -- default theme
--    transparency = false,
-- }
--
-- M.plugins = {
--    override = {},
--    remove = {},
--    user = {},
--    options = {
--       lspconfig = {
--          setup_lspconf = "", -- path of lspconfig file
--       },
--    },
-- }
--
-- -- check core.mappings for table structure
-- M.mappings = require "core.mappings"
