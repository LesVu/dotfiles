local lspconfig = require "lspconfig"
local util = require "lspconfig.util"
local nvlsp = require "nvchad.configs.lspconfig"

local servers = { "html", "bashls", "jsonls", "cssls", "pyright" }
local servers_mod = {
  denols = {
    root_dir = function(fname)
      return util.root_pattern("deno.json", "deno.jsonc")(fname)
    end,
    autostart = false,
  },
  ts_ls = {
    root_dir = function(fname)
      return util.find_package_json_ancestor(fname)
    end,
  },
  rust_analyzer = {
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
  },
  yamlls = {
    settings = {
      yaml = {
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        },
      },
    },
  },
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

for name, opts in pairs(servers_mod) do
  opts.on_attach = nvlsp.on_attach
  opts.on_init = nvlsp.on_init
  opts.capabilities = nvlsp.capabilities

  require("lspconfig")[name].setup(opts)
end
