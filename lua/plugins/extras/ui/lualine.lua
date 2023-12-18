local lsp = {
  function()
    local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }
    if #buf_clients == 0 then return "LSP Inactive" end

    local formatters = require("conform").list_formatters(0)
    local buf_linters = require("lint").linters_by_ft[vim.bo.filetype]

    local buf_client_names = {}
    local buf_formatters = {}

    -- add client
    for _, client in pairs(buf_clients) do
      if client.name ~= "null-ls" and client.name ~= "copilot" then table.insert(buf_client_names, client.name) end
    end

    -- add linter
    -- for _, client in pairs(formatters) do
    --  table.insert(buf_linters, client.name)
    -- end

    -- add formatter
    for _, client in pairs(formatters) do
      table.insert(buf_formatters, client.name)
    end

    vim.list_extend(buf_client_names, buf_formatters)

    local unique_client_names = table.concat(buf_client_names, ", ")
    local language_servers = string.format("%s", unique_client_names)

    return language_servers
  end,
}

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts) table.insert(opts.sections.lualine_x, lsp) end,
  },
}
