local M = {}

M.disabled = {
  n = {
    ["<leader>q"] = "",
  },
}

M.default = {
  n = {
    ["<leader>ww"] = { "<cmd> w <CR>", "   write" },
    ["<leader>q"] = { "<cmd> q <CR>", "   quit" },
  },
}

M.lspconfig = {
  n = {
    ["<leader>fi"] = { "<cmd> LspInfo <CR>", "   Lsp Info" },
  },
}

return M
