return {
  {
    "epwalsh/pomo.nvim", -- https://github.com/epwalsh/pomo.nvim
    version = "*", -- Recommended, use latest release instead of latest commit
    lazy = true,
    cmd = { "TimerStart", "TimerRepeat" },
    opts = {
      -- How often the notifiers are updated.
      update_interval = 1000,

      -- Configure the default notifiers to use for each timer.
      -- You can also configure different notifiers for timers given specific names, see
      -- the 'timers' field below.
      notifiers = {
        -- The "Default" notifier uses 'vim.notify' and works best when you have 'nvim-notify' installed.
        {
          name = "Default",
          opts = {
            -- With 'nvim-notify', when 'sticky = true' you'll have a live timer pop-up
            -- continuously displayed. If you only want a pop-up notification when the timer starts
            -- and finishes, set this to false.
            sticky = false,
          },
        },
        -- The "System" notifier sends a system notification when the timer is finished.
        -- Currently this is only available on MacOS.
        -- Tracking: https://github.com/epwalsh/pomo.nvim/issues/3
        { name = "System" },
      },
      -- Override the notifiers for specific timer names.
      timers = {
        -- For example, use only the "System" notifier when you create a timer called "Break",
        -- e.g. ':TimerStart 2m Break'.
        Break = {
          { name = "System" },
        },
      },
    },
  },
}
