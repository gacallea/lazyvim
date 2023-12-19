-- ~/.config/luacheck/.luacheckrc
-- Global objects
globals = {
  "vim",
}

-- Rerun tests only if their modification time changed
cache = true

-- Don't report unused self arguments of methods
self = false

ignore = {
  "212/_.*", -- unused argument, for vars with "_" prefix
}
