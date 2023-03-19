---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<leader>q"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>ww"] = { "<cmd> w <CR>", "   write" },
    ["<leader>q"] = { "<cmd> q <CR>", "   quit" },
  },
}

M.lspconfig = {
  n = {
    ["<leader>fi"] = { "<cmd> LspInfo <CR>", "   Lsp Info" },
  },
}
-- more keybinds!

return M
