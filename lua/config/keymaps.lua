-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")
vim.keymap.set("n", "<M-Left>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<M-Right>", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<F11>", "<cmd>TroubleToggle<cr>", { desc = "Trouble" })
vim.keymap.set("n", "<F12>", "<cmd>AerialToggle<cr>", { desc = "Aerial (Symbols)" })
vim.keymap.set(
  "n",
  "<leader>/",
  function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
  { desc = "Toggle comment for line" }
)
vim.keymap.set(
  "v",
  "<leader>/",
  "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
  { desc = "Toggle comment for selection" }
)
