local path_to_elixirls =
  vim.fn.expand "/Users/andreacfromtheapp/.local/share//nvim/mason/packages/elixir-ls/language_server.sh"

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
  -- {
  --   "elixir-tools/elixir-tools.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   ft = { "elixir" },
  --   version = "*",
  --   event = { "BufReadPre", "BufNewFile" },
  --   config = function()
  --     local elixir = require "elixir"
  --     local elixirls = require "elixir.elixirls"

  --     elixir.setup {
  --       nextls = { enable = true },
  --       credo = { enable = true },
  --       elixirls = {
  --         enable = true,
  --         settings = elixirls.settings {
  --           dialyzerEnabled = false,
  --           enableTestLenses = false,
  --         },
  --         -- on_attach = function(client, bufnr)
  --         --   vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
  --         --   vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
  --         --   vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
  --         -- end,
  --       },
  --     }
  --   end,
  -- },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "elixir-ls", "nextls" })
    end,
  },
  -- {
  --   "stevearc/conform.nvim",
  --   opts = {
  --     formatters_by_ft = {
  --       elixir = { "mix" },
  --     },
  --   },
  -- },
  -- {
  --   "mfussenegger/nvim-lint",
  --   opts = function(_, opts)
  --     if vim.fn.executable "credo" == 0 then return end
  --     opts.linters_by_ft = {
  --       elixir = { "credo" },
  --     }
  --   end,
  -- },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       elixirls = {
  --         cmd = { path_to_elixirls },
  --       },
  --     },
  --   },
  -- },
  -- {
  --   "nvim-neotest/neotest",
  --   dependencies = {
  --     { "jfpedroza/neotest-elixir" },
  --   },
  --   opts = {
  --     adapters = {
  --       ["neotest-elixir"] = {},
  --     },
  --   },
  -- },
}
