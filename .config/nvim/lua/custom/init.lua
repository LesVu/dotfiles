-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
vim.g.vscode_snippets_path = os.getenv "HOME" .. "/.config/nvim/lua/custom/snippets"
