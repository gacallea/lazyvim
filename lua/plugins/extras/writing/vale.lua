local function get_cur_file_extension(bufnr)
  bufnr = bufnr or 0
  return "." .. vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":e")
end

-- markdown deps in markdown lang plugin
return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "vale" })
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
}
