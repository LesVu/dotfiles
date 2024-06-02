local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    sh = { "shfmt" },
    python = { "black" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1500,
    lsp_fallback = true,
  },

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

require("conform").setup(options)
