local lsp = {
  function()
    local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }
    if #buf_clients == 0 then return "LSP Inactive" end

    local formatters = require("conform").list_formatters(0)
    local linters = require("lint").linters_by_ft[vim.bo.filetype]

    local buf_client_names = {}
    local buf_formatters = {}
    local buf_linters = {}

    -- add client
    for _, client in pairs(buf_clients) do
      if client.name ~= "null-ls" and client.name ~= "copilot" then table.insert(buf_client_names, client.name) end
    end

    -- add formatter
    for _, formatter in pairs(formatters) do
      table.insert(buf_formatters, formatter.name)
    end

    -- add linter
    for _, linter in pairs(linters) do
      table.insert(buf_linters, linter)
    end

    vim.list_extend(buf_client_names, buf_formatters)
    vim.list_extend(buf_client_names, buf_linters)

    local unique_client_names = table.concat(buf_client_names, ", ")
    local language_servers = string.format("%s", unique_client_names)

    return language_servers
  end,
}

local clock = {
  function() return os.date "%I:%M %p" end,
}

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, lsp)
      opts.sections.lualine_z = { clock }
    end,
  },
}
