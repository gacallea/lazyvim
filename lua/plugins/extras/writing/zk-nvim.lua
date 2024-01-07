-- only zk here, for markdown see lang.markdown
-- this plugin will setup and start the LSP server for you

return {
  {
    "zk-org/zk-nvim",
    config = function()
      require("zk").setup {
        picker = "telescope",
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "zk" })
    end,
  },
}
