return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "elixir",
          "heex",
          "eex",
        })
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "elixir-ls" })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        elixir = { "mix" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      if vim.fn.executable "credo" == 0 then return end
      opts.linters_by_ft = {
        elixir = { "credo" },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        elixirls = {},
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      { "jfpedroza/neotest-elixir" },
    },
    opts = {
      adapters = {
        ["neotest-elixir"] = {},
      },
    },
  },
}
