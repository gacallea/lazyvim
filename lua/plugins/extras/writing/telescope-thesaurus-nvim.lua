return {
  {
    "rafi/telescope-thesaurus.nvim",
    keys = {
      { "<leader>fw", "<Cmd>Telescope thesaurus lookup<CR>", desc = "Lookup word" },
      -- { "<leader>fW", "<Cmd>Telescope thesaurus query=hello<CR>", desc = "Query word" },
    },
    dependencies = {
      {
        "nvim-telescope/telescope.nvim",
        opts = {
          extensions = {
            thesaurus = {
              -- provider = "dictionaryapi", -- merriam-webster requires an API key but can't seem to register
              provider = "datamuse",
            },
          },
        },
      },
    },
    config = function()
      local ok, telescope = pcall(require, "telescope")
      if ok then telescope.load_extension "thesaurus" end
    end,
  },
}
