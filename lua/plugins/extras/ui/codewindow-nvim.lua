return {
  {
    "gorbit99/codewindow.nvim",
    keys = {
      { "<leader>um", function() require("codewindow").toggle_minimap() end, desc = "Toggle minimap" },
    },
    config = function()
      local codewindow = require "codewindow"
      codewindow.setup()
    end,
  },
}
