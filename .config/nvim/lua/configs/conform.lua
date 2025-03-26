local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    sh = { "shfmt" },
    python = { "black" },
    c = { "clang-format" },
    rust = { "rustfmt", lsp_format = "fallback" },
    yaml = { "yamlfmt" },
    json = { "prettierd" },
  },

  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { timeout_ms = 1500, lsp_format = "fallback" }
  end,

  formatters = {
    prettierd = {
      env = {
        PRETTIERD_DEFAULT_CONFIG = os.getenv "HOME" .. "/.config/nvim/lua/configs/formatter_sources/.prettierrc.json",
      },
    },

    stylua = {
      prepend_args = { "--config-path", os.getenv "HOME" .. "/.config/nvim/.stylua.toml" },
    },

    shfmt = {
      prepend_args = { "-i", "2", "-ci", "-bn" },
    },

    black = {
      command = os.getenv "HOME" .. "/.local/share/nvim/mason/packages/black/venv/bin/black",
    },
  },
}

return options
