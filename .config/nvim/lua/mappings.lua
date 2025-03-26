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

-- Terminal
map({ "n", "t" }, "<C-`>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal remapped toggle floating term" })

-- Avante

-- C-e C-x
map({ "n", "i", "v" }, "<C-e>", "<Esc>", { desc = "Remap of Escape to Control-e" })
map("n", "<C-x>", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- Codeium
map("i", "<Tab>", function()
  return vim.fn["codeium#Accept"]()
end, { desc = "Codeium accept suggestion", expr = true })
map("i", "<M-]>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { desc = "Codeium next suggestion", expr = true })
map("i", "<M-[>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { desc = "Codeium previous suggestion", expr = true })
map("i", "<M-c>", function()
  return vim.fn["codeium#Clear"]()
end, { desc = "Codeium clear suggestion", expr = true })
map("i", "<M-Enter>", function()
  return vim.fn["codeium#Complete"]()
end, { desc = "Codeium trigger suggestion", expr = true })

