return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "luacheck",
      "shfmt",
      "shellcheck",
      "black",
      "flake8",
      "elm-format",
      "markdownlint",
      "standardjs",
      "ts-standard",
    },
  },
}
