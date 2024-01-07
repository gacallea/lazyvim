-- markdown deps in markdown lang plugin
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then vim.list_extend(opts.ensure_installed, { "latex" }) end
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "ltex-ls" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ltex = {
          cmd = { "ltex-ls" },
          enabled = { "latex", "tex", "bib", "markdown" },
          -- checkFrequency = "edit",
          language = "en-US",
          diagnosticSeverity = "information",
          setenceCacheSize = 2000,
          -- additionalRules = {
          --   enablePickyRules = true,
          --   motherTongue = "en-US",
          -- },
          dictionary = {},
          disabledRules = {},
          hiddenFalsePositives = {},
        },
      },
    },
  },
}
