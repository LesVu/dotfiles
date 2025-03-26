-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",
  theme_toggle = { "onedark", "oceanic-next", "catppuccin" },
}

M.nvdash = {
  load_on_startup = true,

  header = {
    '         .-"      "-.  ',
    "       /            \\   ",
    "      |              |   ",
    "      |  +      +    |   ",
    "      |              |   ",
    "       \\            /   ",
    '         "-.____.-"    ',
    "                         ",
    "         /   |   \\      ",
    "  (e-)--O    |    O--(e-)",
    "         \\   |   /      ",
    "            (n)          ",
  },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
