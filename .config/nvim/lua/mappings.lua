require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- write quit map
map("n", "<leader>wq", "<cmd> wq <CR>", { desc = "  write and quit" })
-- write map
map("n", "<leader>ww", "<cmd> w <CR>", { desc = "  write" })
-- quit map
map("n", "<leader>we", "<cmd> q <CR>", { desc = "  quit" })
