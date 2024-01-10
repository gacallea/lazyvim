return {
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>C"] = { name = "+chuck" },
      },
    },
  },
  {
    -- "gacallea/chuck-nvim",
    dir = "/Users/andreacfromtheapp/ProjectsandIdeas/Programming/Neovim/chuck-nvim",
    name = "chuck-nvim",
    dependencies = {
      {
        "nvim-tree/nvim-web-devicons",
        opts = {
          override_by_extension = {
            ["ck"] = {
              icon = "󰧚",
              color = "#80ff00",
              name = "ChucK",
            },
          },
        },
      },
    },
    ft = { "chuck" },
    cmd = { "ChuckStatus", "ChuckAddShred", "ChuckRemoveShreds", "ChuckReplaceShred", "ChuckClearShreds" },
    keys = {
      { "<leader>Cs", "<cmd>ChuckStatus<cr>", desc = "Chuck Status", mode = "n" },
      { "<leader>Ca", "<cmd>ChuckAddShred<cr>", desc = "Add Shred", mode = "n" },
      { "<leader>Cd", "<cmd>ChuckRemoveShreds<cr>", desc = "Remove Shreds", mode = "n" },
      { "<leader>Cr", "<cmd>ChuckReplaceShred<cr>", desc = "Replace Shred", mode = "n" },
      { "<leader>Cc", "<cmd>ChuckClearShreds<cr>", desc = "Clear Shreds", mode = "n" },
    },
    config = function() require "chuck-nvim" end,
  },
}
