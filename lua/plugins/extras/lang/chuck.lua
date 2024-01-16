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
      { "MunifTanjim/nui.nvim" },
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
    cmd = {
      "ChuckLoop",
      "ChuckStatus",
      "ChuckTime",
      "ChuckAddShred",
      "ChuckRemoveShreds",
      "ChuckReplaceShred",
      "ChuckClearShreds",
      "ChuckClearVM",
      "ChuckExit",
    },
    keys = {
      { "<leader>Cl", "<cmd>ChuckLoop<cr>", desc = "Chuck Loop", mode = "n" },
      { "<leader>Cs", "<cmd>ChuckStatus<cr>", desc = "Chuck Status", mode = "n" },
      { "<leader>Ct", "<cmd>ChuckTime<cr>", desc = "Chuck Time", mode = "n" },
      { "<leader>Ca", "<cmd>ChuckAddShred<cr>", desc = "Add Shred", mode = "n" },
      { "<leader>Cd", "<cmd>ChuckRemoveShreds<cr>", desc = "Remove Shred(s)", mode = "n" },
      { "<leader>Cr", "<cmd>ChuckReplaceShred<cr>", desc = "Replace Shred", mode = "n" },
      { "<leader>Cc", "<cmd>ChuckClearShreds<cr>", desc = "Clear Shreds", mode = "n" },
      { "<leader>Cv", "<cmd>ChuckClearVM<cr>", desc = "Clear VM", mode = "n" },
      { "<leader>Ce", "<cmd>ChuckExit<cr>", desc = "Exit ChucK", mode = "n" },
    },
    opts = {
      log_level = 2,
      srate = 48000,
      bufsize = 512,
      dac = 0,
      adc = 0,
      channels = 2,
      input = 2,
      output = 2,
      remote = "127.0.0.1",
      port = 8888,
    },
  },
}
