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
    -- "c",
    "markdown",
    "markdown_inline",
    "python",
  },
  indent = {
    enable = true,
    disable = {},
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    -- "deno",
    "prettierd",
    "bash-language-server",
    "json-lsp",
    "yaml-language-server",
    -- "rust-analyzer",

    "pyright",
    "black",
    -- "flake8",
  },
}

return M
