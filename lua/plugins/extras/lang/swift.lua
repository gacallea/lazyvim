local util = require "lspconfig.util"

local pattern = "[^:]+:(%d+):(%d+): (%w+): (.+)"
local groups = { "lnum", "col", "severity", "message" }
local defaults = { ["source"] = "swiftlint" }
local severity_map = {
  ["error"] = vim.diagnostic.severity.ERROR,
  ["warning"] = vim.diagnostic.severity.WARN,
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then vim.list_extend(opts.ensure_installed, { "swift" }) end
    end,
  },
  -- {
  --   "williamboman/mason.nvim",
  --   opts = function(_, opts)
  --     opts.ensure_installed = opts.ensure_installed or {}
  --     vim.list_extend(opts.ensure_installed, { "sourcekit-lsp" })
  --   end,
  -- },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        swift = { "swiftformat" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        swiftlint = {
          cmd = "swiftlint",
          stdin = true,
          args = {
            "lint",
            "--use-stdin",
            -- "--config",
            --  function() return ".swiftlint.yml" or os.getenv "HOME" .. "/.config/nvim/.swiftlint.yml" end,
            --   "-",
          },
          stream = "stdout",
          ignore_exitcode = true,
          parser = require("lint.parser").from_pattern(pattern, groups, severity_map, defaults),
        },
      },
      linters_by_ft = {
        swift = { "swiftlint" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sourcekit = {
          cmd = { "sourcekit-lsp" },
          filetypes = { "swift", "objective-c", "objective-cpp" },
          -- root_dir = util.root_pattern("Package.swift", "buildServer.json", "compile_commands.json", ".git"),
          root_dir = function(filename, _)
            return util.root_pattern "buildServer.json"(filename)
              or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
              or util.find_git_ancestor(filename)
              or util.root_pattern "Package.swift"(filename)
          end,
        },
      },
    },
  },
}
