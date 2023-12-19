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
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { "codelldb" })
        end,
      },
    },
  },
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
          stdin = false,
          args = {
            "lint",
            "--force-exclude",
            "--use-alternative-excluding",
            "--config",
            function() return ".swiftlint.yml" or os.getenv "HOME" .. "/.config/nvim/.swiftlint.yml" end,
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
          -- cmd = { "sourcekit-lsp" },
          cmd = {
            "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp",
          },
          filetypes = { "swift", "objective-c", "objective-cpp" },
          root_dir = function(filename, _)
            return util.find_git_ancestor(filename)
              or util.root_pattern "Package.swift"(filename)
              or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
              or util.root_pattern "buildServer.json"(filename)
              or util.root_pattern "compile_commands.json"(filename)
              or util.root_pattern ".git"(filename)
          end,
        },
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>X"] = { name = "+xcodebuild" },
      },
    },
  },
  {
    "wojciech-kulik/xcodebuild.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>Xl", "<cmd>XcodebuildToggleLogs<cr>", desc = "Toggle Xcodebuild Logs", mode = "n" },
      { "<leader>Xb", "<cmd>XcodebuildBuild<cr>", desc = "Build Project", mode = "n" },
      { "<leader>Xr", "<cmd>XcodebuildBuildRun<cr>", desc = "Build & Run Project", mode = "n" },
      { "<leader>Xt", "<cmd>XcodebuildTest<cr>", desc = "Run Tests", mode = "n" },
      { "<leader>XT", "<cmd>XcodebuildTestClass<cr>", desc = "Run This Test Class", mode = "n" },
      { "<leader>XX", "<cmd>XcodebuildPicker<cr>", desc = "Show All Xcodebuild Actions", mode = "n" },
      { "<leader>Xd", "<cmd>XcodebuildSelectDevice<cr>", desc = "Select Device", mode = "n" },
      { "<leader>Xp", "<cmd>XcodebuildSelectTestPlan<cr>", desc = "Select Test Plan", mode = "n" },
      { "<leader>Xc", "<cmd>XcodebuildToggleCodeCoverage<cr>", desc = "Toggle Code Coverage", mode = "n" },
      { "<leader>XC", "<cmd>XcodebuildShowCodeCoverageReport<cr>", desc = "Show Code Coverage Report", mode = "n" },
      { "<leader>Xq", "<cmd>Telescope quickfix<cr>", desc = "Show QuickFix List", mode = "n" },
    },
    config = function()
      require("xcodebuild").setup {
        logs = {
          auto_open_on_success_tests = false,
          auto_open_on_failed_tests = true,
          auto_open_on_success_build = false,
          auto_open_on_failed_build = true,
          auto_focus = false,
          auto_close_on_app_launch = true,
        },
        code_coverage = {
          enabled = false,
        },
      }
    end,
  },
}
