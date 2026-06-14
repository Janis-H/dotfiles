-- Restore Neovim sessions automatically
-- TODO: setup keymaps
return {
  "rmagatti/auto-session",
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    session_lens = {
        picker = "telescope",
    },
    -- log_level = 'debug',
  },
}
