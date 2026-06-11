local grapple = require("grapple")

grapple.setup({
    -- Decides which tag list grapple us
    -- "git" shares one tag list across all branches in a repo
    -- "git_branch" keeps seperate tag lists per repo + branch
    scope = "git_branch",

    -- Grapple popup window size/position.
    win_opts = {
        width = 80,
        height = 12,
        row = 0.5,
        col = 0.5,

        relative = "editor",
        border = "single",
        focusable = false,
        style = "minimal",

        title = "Grapple",
        title_pos = "center",
    },
})

-- Remaps:
local opts = { noremap = true, silent = true }

-- add/remove current file 
vim.keymap.set('n', '<leader>m', grapple.toggle, opts)
-- open/close tag list
vim.keymap.set('n', '<leader>M', grapple.toggle_tags, opts)

-- jump to Grapple tags by index
vim.keymap.set("n", "<leader>1", "<CMD>Grapple select index=1<CR>", opts)
vim.keymap.set("n", "<leader>2", "<CMD>Grapple select index=2<CR>", opts)
vim.keymap.set("n", "<leader>3", "<CMD>Grapple select index=3<CR>", opts)
vim.keymap.set("n", "<leader>4", "<CMD>Grapple select index=4<CR>", opts)
vim.keymap.set("n", "<leader>5", "<CMD>Grapple select index=5<CR>", opts)
