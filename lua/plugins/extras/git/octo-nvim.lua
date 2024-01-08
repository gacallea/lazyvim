return {
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>O"] = {
          name = "+Octo",
          c = { "Comments" },
          t = { "Threads" },
          i = { "Issues" },
          p = { "Pull Requests" },
          r = { "Repo" },
          a = { "Assignee/Review" },
          l = { "Label" },
          e = { "Reaction" },
          s = { "Review" },
        },
      },
    },
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = { "Octo" },
    opts = {
      default_remote = { "upstream", "origin" }, -- order to try remotes
      ssh_aliases = {}, -- SSH aliases. e.g. `ssh_aliases = {["github.com-work"] = "github.com"}`
      gh_env = {}, -- extra environment variables to pass on to GitHub CLI, can be a table or function returning a table
      picker = "telescope",
      use_diagnostic_signs = true,
      mappings = {},
    },
    keys = {
      -- All actions browser
      { "<leader>Ox", "<cmd>Octo actions<CR>", desc = "Run an action" },
      -- Comments
      { "<leader>Oca", "<cmd>Octo comment add<CR>", desc = "Add a new comment" },
      { "<leader>Ocd", "<cmd>Octo comment delete<CR>", desc = "Delete a comment" },
      -- Threads
      { "<leader>Ota", "<cmd>Octo thread resolve<CR>", desc = "Mark thread as resolved" },
      { "<leader>Otd", "<cmd>Octo thread unresolve<CR>", desc = "Mark thread as unresolved" },
      -- Issues
      { "<leader>Oic", "<cmd>Octo issue close<CR>", desc = "Close current issue" },
      { "<leader>Oir", "<cmd>Octo issue reopen<CR>", desc = "Reopen current issue" },
      { "<leader>Oil", "<cmd>Octo issue list<CR>", desc = "List open issues" },
      { "<leader>Oiu", "<cmd>Octo issue url<CR>", desc = "Copies URL of current issue" },
      { "<leader>Oio", "<cmd>Octo issue browser<CR>", desc = "Open current issue in browser" },
      -- PRs
      { "<leader>Opp", "<cmd>Octo pr checkout<CR>", desc = "Checkout PR" },
      { "<leader>Opmm", "<cmd>Octo pr merge commit<CR>", desc = "Merge commit PR" },
      { "<leader>Opms", "<cmd>Octo pr merge squash<CR>", desc = "Squash merge PR" },
      { "<leader>Opmd", "<cmd>Octo pr merge delete<CR>", desc = "Delete merge PR" },
      { "<leader>Opmr", "<cmd>Octo pr merge rebase<CR>", desc = "Rebase merge PR" },
      { "<leader>Opc", "<cmd>Octo pr close<CR>", desc = "Close current PR" },
      { "<leader>Opn", "<cmd>Octo pr create<CR>", desc = "Create PR for current branch" },
      { "<leader>Opd", "<cmd>Octo pr diff<CR>", desc = "Show PR diff" },
      { "<leader>Ops", "<cmd>Octo pr list<CR>", desc = "List open PRs" },
      { "<leader>Opr", "<cmd>Octo pr ready<CR>", desc = "Mark draft as ready for review" },
      { "<leader>Opo", "<cmd>Octo pr browser<CR>", desc = "Open current PR in browser" },
      { "<leader>Opu", "<cmd>Octo pr url<CR>", desc = "Copies URL of current PR" },
      { "<leader>Opt", "<cmd>Octo pr commits<CR>", desc = "List PR commits" },
      { "<leader>Opl", "<cmd>Octo pr commits<CR>", desc = "List changed files in PR" },
      -- Repo
      { "<leader>Orl", "<cmd>Octo repo list<CR>", desc = "List repo user stats" },
      { "<leader>Orf", "<cmd>Octo repo fork<CR>", desc = "Fork repo" },
      { "<leader>Oro", "<cmd>Octo repo browser<CR>", desc = "Open current repo in browser" },
      { "<leader>Oru", "<cmd>Octo repo url<CR>", desc = "Copies URL of current repo" },
      -- Assignee/Reviewer
      { "<leader>Oaa", "<cmd> Octo assignee add<CR>", desc = "Assign a user" },
      { "<leader>Oar", "<cmd> Octo assignee remove<CR>", desc = "Remove a user" },
      { "<leader>Oap", "<cmd> Octo reviewer add<CR>", desc = "Assign a PR reviewer" },
      -- Label
      { "<leader>Ola", "<cmd> Octo label add<CR>", desc = "Assign a label" },
      { "<leader>Olr", "<cmd> Octo label remove<CR>", desc = "Remove a label" },
      { "<leader>Olc", "<cmd> Octo label create<CR>", desc = "Create a label" },
      -- Reaction
      { "<leader>Oe1", "<cmd>Octo reaction thumbs_up<CR>", desc = "Add 👍 reaction" },
      { "<leader>Oe2", "<cmd>Octo reaction thumbs_down<CR>", desc = "Add 👎 reaction" },
      { "<leader>Oe3", "<cmd>Octo reaction eyes<CR>", desc = "Add 👀 reaction" },
      { "<leader>Oe4", "<cmd>Octo reaction laugh<CR>", desc = "Add 😄 reaction" },
      { "<leader>Oe5", "<cmd>Octo reaction confused<CR>", desc = "Add 😕 reaction" },
      { "<leader>Oe6", "<cmd>Octo reaction rocket<CR>", desc = "Add 🚀 reaction" },
      { "<leader>Oe7", "<cmd>Octo reaction heart<CR>", desc = "Add ❤️ reaction" },
      { "<leader>Oe8", "<cmd>Octo reaction party<CR>", desc = "Add 🎉 reaction" },
      -- Review
      { "<leader>Oss", "<cmd> Octo review start<CR>", desc = "Start review" },
      { "<leader>Osf", "<cmd> Octo review submit<CR>", desc = "Submit review" },
      { "<leader>Osr", "<cmd> Octo review resume<CR>", desc = "Resume review" },
      { "<leader>Osd", "<cmd> Octo review discard<CR>", desc = "Delete pending review" },
      { "<leader>Osc", "<cmd> Octo review comments<CR>", desc = "View pending comments" },
      { "<leader>Osp", "<cmd> Octo review commit<CR>", desc = "Select commit to review" },
      { "<leader>Osc", "<cmd> Octo review close<CR>", desc = "Return to PR" },
    },
  },
}
