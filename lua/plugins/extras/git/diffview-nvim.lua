return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Diff view", mode = { "n", "v" } },
    },
  },
}
