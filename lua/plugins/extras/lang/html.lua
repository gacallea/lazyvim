return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then vim.list_extend(opts.ensure_installed, { "html" }) end
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "html-lsp", "emmet-ls", "prettierd" })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        html = { "prettierd" },
      },
    },
  },
  -- {
  --   "mfussenegger/nvim-lint",
  --   opts = {
  --     linters_by_ft = {
  --       html = {},
  --     },
  --   },
  -- },
  {
    "neovim/nvim-lspconfig",
    ft = { "html" },
    opts = {
      servers = {
        html = {
          filetypes = {
            "html",
          },
        },
        emmet_ls = {
          filetypes = {
            "html",
          },
        },
      },
    },
  },
}
