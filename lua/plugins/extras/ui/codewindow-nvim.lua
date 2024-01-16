return {
  {
    "gorbit99/codewindow.nvim",
    keys = {
      { "<leader>um", function() require("codewindow").toggle_minimap() end, desc = "Toggle minimap" },
    },
    init = function() require "codewindow" end,
    opts = {
      auto_enable = true,
      minimap_width = 18,
      width_multiplier = 2,
      screen_bounds = "background",
      window_border = "none",
      relative = "win",
      exclude_filetypes = {
        "dashboard",
        "neo-tree",
        "lazy",
        "lazyterm",
        "mason",
        "help",
        "checkhealth",
        "lspinfo",
        "noice",
        "Trouble",
        "fish",
        "zsh",
      },
    },
  },
}
