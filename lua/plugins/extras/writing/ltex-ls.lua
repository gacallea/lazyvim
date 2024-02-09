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
          cmd = { "/opt/homebrew/bin/ltex-ls" }, -- install ltex-ls with brew install ltex-ls
          root_dir = function(filename) return util.path.dirname(filename) end,
        },
      },
      settings = { -- https://valentjn.github.io/ltex/settings.html
        ltex = {
          enabled = {
            "latex",
            "markdown",
            "org",
            "restructuredtext",
          },
          language = "en-US",
          diagnosticSeverity = "information", --  The possible severities are "error", "warning", "information", and "hint".
          sentenceCacheSize = 2000,
          completionEnabled = false,
          additionalRules = {
            enablePickyRules = false,
            motherTongue = "it",
          },
          checkFrequency = "save",
          -- language-specific settings:
          dictionary = {}, -- Lists of additional words that should not be counted as spelling errors.
          disabledRules = {}, -- Lists of rules that should be disabled (if enabled by default by LanguageTool).
          enabledRules = {}, -- Lists of rules that should be enabled (if disabled by default by LanguageTool).
          hiddenFalsePositives = {}, -- Lists of false-positive diagnostics to hide (by hiding all diagnostics of a specific rule within a specific sentence).
        },
      },
    },
  },
}
