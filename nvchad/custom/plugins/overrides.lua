-- overriding default plugin configs!

local M = {}

M.nvimtree = {
   git = {
      enable = true,
   },

   renderer = {
      highlight_git = true,
      icons = {
         show = {
            git = true,
         },
      },
   },
}

M.treesitter = {
   ensure_installed = {
      "bash",
      "c",
      "javascript",
      "json",
      "lua",
      "python",
      "typescript",
      "css",
      "rust",
      "yaml",
   },
   ignore_install = { "haskell" },
   highlight = { enabled = true },
   rainbow = {
      enable = true,
      -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
      colors = {
         "#F08080",
         "#00FF7F",
         "#00FFFF",
         "#DA70D6",
      }, -- table of hex strings
      -- termcolors = {} -- table of colour name strings
   },
}

return M
