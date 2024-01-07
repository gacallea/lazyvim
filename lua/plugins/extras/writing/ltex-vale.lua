local function get_cur_file_extension(bufnr)
  bufnr = bufnr or 0
  return "." .. vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":e")
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline", "latex" })
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      -- vim.list_extend(opts.ensure_installed, { "ltex-ls", "alex", "write-good", "vale" })
      vim.list_extend(opts.ensure_installed, { "ltex-ls", "vale" })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = { "vale" },
        text = { "vale" },
        gitcommit = { "vale" },
        tex = { "vale" },
        pandoc = { "vale" },
      },
      linters = {
        vale = {
          args = {
            "--config=/Users/andreacfromtheapp/.vale/.vale.ini",
            "--no-exit",
            "--output",
            "JSON",
            "--ext",
            get_cur_file_extension,
          },
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ltex = {
          language = "en-US",
        },
      },
    },
  },
}
