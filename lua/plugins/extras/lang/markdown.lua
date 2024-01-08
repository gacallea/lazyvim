return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "markdownlint", "marksman" })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        markdown = { "markdownlint" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = { "markdownlint" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    ft = { "markdown", "markdown_inline" },
    opts = {
      servers = {
        marksman = {},
      },
    },
  },
  {
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    opts = {},
  },
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --   build = function() vim.fn["mkdp#util#install"]() end,
  --   keys = {
  --     {
  --       "<leader>cp",
  --       ft = "markdown",
  --       "<cmd>MarkdownPreviewToggle<cr>",
  --       desc = "Markdown Preview",
  --     },
  --   },
  --   config = function() vim.cmd [[do FileType]] end,
  -- },
}
