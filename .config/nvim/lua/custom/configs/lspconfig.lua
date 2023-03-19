local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "bashls", "jsonls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local util = require "lspconfig.util"

lspconfig.denols.setup {
  root_dir = function(fname)
    return util.root_pattern("deno.json", "deno.jsonc")(fname)
  end,
  autostart = false,
}
-- fix Tsserver clashing with deno
lspconfig.tsserver.setup {
  root_dir = function(fname)
    return util.find_package_json_ancestor(fname)
  end,
}

lspconfig.rust_analyzer.setup {
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

lspconfig.yamlls.setup {
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
      },
    },
  },
}

--
-- lspconfig.pyright.setup { blabla}
