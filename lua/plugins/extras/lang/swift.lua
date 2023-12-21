local swift_ft = { "swift", "objc", "objcpp" }
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
  -- {
  --   "williamboman/mason.nvim",
  --   opts = function(_, opts)
  --     opts.ensure_installed = opts.ensure_installed or {}
  --     vim.list_extend(opts.ensure_installed, { "sourcekit-lsp" })
  --   end,
  -- },
  {
    "neovim/nvim-lspconfig",
    ft = swift_ft,
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
    ft = swift_ft,
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
    },
    config = function()
      require("xcodebuild").setup {
        restore_on_start = true, -- logs, diagnostics, and marks will be loaded on VimEnter (may affect performance)
        auto_save = true, -- save all buffers before running build or tests (command: silent wa!)
        show_build_progress_bar = true, -- shows [ ...    ] progress bar during build, based on the last duration
        prepare_snapshot_test_previews = true, -- prepares a list with failing snapshot tests
        test_search = {
          file_matching = "filename_lsp", -- one of: filename, lsp, lsp_filename, filename_lsp. Check out README for details
          target_matching = true, -- checks if the test file target matches the one from logs. Try disabling it in case of not showing test results
          lsp_client = "sourcekit", -- name of your LSP for Swift files
          lsp_timeout = 200, -- LSP timeout in milliseconds
        },
        logs = {
          auto_open_on_success_tests = false, -- open logs when tests succeeded
          auto_open_on_failed_tests = false, -- open logs when tests failed
          auto_open_on_success_build = false, -- open logs when build succeeded
          auto_open_on_failed_build = false, -- open logs when build failed
          auto_close_on_app_launch = false, -- close logs when app is launched
          auto_close_on_success_build = false, -- close logs when build succeeded (only if auto_open_on_success_build=false)
          auto_focus = true, -- focus logs buffer when opened
          filetype = "objc", -- file type set for buffer with logs
          open_command = "silent bo split {path} | resize 20", -- command used to open logs panel. You must use {path} variable to load the log file
          logs_formatter = "xcbeautify --disable-colored-output", -- command used to format logs, you can use "" to skip formatting
          only_summary = false, -- if true logs won't be displayed, just xcodebuild.nvim summary
          show_warnings = true, -- show warnings in logs summary
        },
        quickfix = {
          show_errors_on_quickfixlist = true, -- add build/test errors to quickfix list
          show_warnings_on_quickfixlist = true, -- add build warnings to quickfix list
        },
        code_coverage = {
          enabled = false, -- generate code coverage report and show marks
          file_pattern = "*.swift", -- coverage will be shown in files matching this pattern
        },
      }
    end,
  },
  -- {
  --   "mfussenegger/nvim-dap",
  --   ft = swift_ft,
  --   dependencies = {
  --     {
  --       "williamboman/mason.nvim",
  --       opts = function(_, opts)
  --         opts.ensure_installed = opts.ensure_installed or {}
  --         vim.list_extend(opts.ensure_installed, { "codelldb" })
  --       end,
  --     },
  --   },
  --   keys = {
  --     { "<leader>XD", "<cmd>xcodebuild.build_and_debug<cr>", desc = "Build & Debug", mode = "n" },
  --     { "<leader>XR", "<cmd>xcodebuild.debug_without_build<cr>", desc = "Debug Without Building", mode = "n" },
  --   },
  --   config = function()
  --     local dap = require "dap"
  --     local xcodebuild = require "xcodebuild.dap"

  --     dap.configurations.swift = {
  --       {
  --         name = "iOS App Debugger",
  --         type = "codelldb",
  --         request = "attach",
  --         program = xcodebuild.get_program_path,
  --         -- alternatively, you can wait for the process manually
  --         -- pid = xcodebuild.wait_for_pid,
  --         cwd = "${workspaceFolder}",
  --         stopOnEntry = false,
  --         waitFor = true,
  --       },
  --     }

  --     dap.adapters.codelldb = {
  --       type = "server",
  --       port = "13000",
  --       executable = {
  --         -- set path to the downloaded codelldb
  --         -- sample path: "/Users/YOU/Downloads/codelldb-aarch64-darwin/extension/adapter/codelldb"
  --         command = "/path/to/codelldb/extension/adapter/codelldb",
  --         args = {
  --           "--port",
  --           "13000",
  --           "--liblldb",
  --           -- make sure that this path is correct on your side
  --           "/Applications/Xcode.app/Contents/SharedFrameworks/LLDB.framework/Versions/A/LLDB",
  --         },
  --       },
  --     }

  --     -- disables annoying warning that requires hitting enter
  --     local orig_notify = require("dap.utils").notify
  --     require("dap.utils").notify = function(msg, log_level)
  --       if not string.find(msg, "Either the adapter is slow") then orig_notify(msg, log_level) end
  --     end
  --   end,
  -- },
}
