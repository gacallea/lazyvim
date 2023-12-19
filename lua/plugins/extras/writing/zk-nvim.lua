-- only zk here, for markdown see lang.markdown

return {
  {
    "mickael-menu/zk-nvim",
    opts = {
      picker = "telescope",
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "zk" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        zk = {},
      },
    },
  },
}
