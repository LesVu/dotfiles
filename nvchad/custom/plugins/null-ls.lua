local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- webdev stuff
  -- b.formatting.deno_fmt,
  b.formatting.prettier,

  -- Lua
  b.formatting.stylua.with {
    extra_args = { "--config-path", os.getenv "HOME" .. "/.config/nvim/.stylua.toml" },
    filetypes = { "lua" },
  },

  -- Shell
  b.formatting.shfmt.with {
    extra_args = { "-i", "2", "-ci", "-bn" },
    filetypes = { "sh" },
  },
  -- b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.formatting_sync(nil, 3000)
        end,
      })
    end
  end,
}
