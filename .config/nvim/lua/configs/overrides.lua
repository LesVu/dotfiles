local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "bash",
    "json",
    "yaml",
    "c",
    "markdown",
    "markdown_inline",
    "python",
    "rust",
  },
  indent = {
    enable = true,
    disable = {},
  },
}

return M
