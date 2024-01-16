return {
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      theme = "catppuccin",
      show_navic = true,
      show_dirname = false,
      show_basename = false,
      show_modified = false,
      context_follow_icon_color = true,
    },
  },
}
