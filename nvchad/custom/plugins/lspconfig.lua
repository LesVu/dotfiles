local M = {}

local util = require "lspconfig.util"

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   local servers = { "bashls" }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
         root_dir = vim.loop.cwd,
      }
   end

   require("lspconfig").denols.setup {
      root_dir = function(fname)
         if not util.root_pattern "package.json"(fname) then
            return util.root_pattern("deno.json", "deno.jsonc", "tsconfig.json", ".git")(fname)
         end
      end,
   }

   -- fix Tsserver clashing with deno
   require("lspconfig").tsserver.setup {
      root_dir = function(fname)
         if util.root_pattern "package.json"(fname) then
            return util.root_pattern "tsconfig.json"(fname)
               or util.root_pattern("package.json", "jsconfig.json", ".git")(fname)
         end
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
