local util = require "lspconfig.util"
local configs = require "nvchad.configs.lspconfig"

local servers = {
  html = {},
  bashls = {},
  jsonls = {},
  cssls = {},
  pyright = {},
  clangd = { mason = false },

  denols = {
    root_dir = function(fname)
      return util.root_pattern("deno.json", "deno.jsonc")(fname)
    end,
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
          buildScripts = {
            enable = true,
          },
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
          ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "/docker-compose.*",
        },
      },
    },
  },
}

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities

  require("lspconfig")[name].setup(opts)
end
