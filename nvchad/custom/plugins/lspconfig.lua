local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"

  local servers = { "bashls", "jsonls" }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = attach,
      capabilities = capabilities,
      root_dir = vim.loop.cwd,
    }
  end

  local util = require "lspconfig.util"

  require("lspconfig").denols.setup {
    root_dir = function(fname)
      return util.root_pattern("deno.json", "deno.jsonc")(fname)
    end,
    autostart = false,
  }
  -- fix Tsserver clashing with deno
  require("lspconfig").tsserver.setup {
    root_dir = function(fname)
      return util.find_package_json_ancestor(fname)
    end,
  }

  require("lspconfig").rust_analyzer.setup {
    settings = {
      ["rust-analyzer"] = {
        assist = {
          importGranularity = "module",
          importPrefix = "by_self",
        },
        cargo = {
          loadOutDirsFromCheck = true,
        },
        procMacro = {
          enable = true,
        },
      },
    },
  }

  require("lspconfig").yamlls.setup {
    settings = {
      yaml = {
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        },
      },
    },
  }
end
return M
