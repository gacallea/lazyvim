local util = require "lspconfig/util"

-- markdown deps in markdown lang plugin
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then vim.list_extend(opts.ensure_installed, { "latex" }) end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ltex = {
          cmd = { "/usr/local/bin/ltex-ls" }, -- install ltex-ls with brew install ltex-ls
          filetypes = { "gitcommit", "markdown", "tex", "pandoc", "rmd" },
          root_dir = function(filename) return util.path.dirname(filename) end,
        },
      },
      settings = {
        ltex = {
          enabled = { "latex", "tex", "bib", "markdown" },
          language = "auto",
          diagnosticSeverity = "information",
          sentenceCacheSize = 2000,
        },
      },
    },
  },
}
