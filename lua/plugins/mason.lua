return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- lua
      "stylua",
      "luacheck",
      -- shell
      "shfmt",
      "shellcheck",
      -- javascript
      "standardjs",
      -- typescript
      "ts-standard",
    },
  },
}
