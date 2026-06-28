-- Highlight and search for todo comments like TODO, HACK, BUG in your code base
return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" } },
    { "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" } },
    { "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Previous todo comment" } },
  }
}
