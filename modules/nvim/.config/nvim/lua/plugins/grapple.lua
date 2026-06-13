return {
    "cbochs/grapple.nvim",
    opts = {
        -- Decides which tag list Grapple uses.
        -- "git" shares one tag list across all branches in a repo.
        -- "git_branch" keeps separate tag lists per repo + branch.
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
    },
    config = function(_, opts)
        local grapple = require("grapple")

        grapple.setup(opts)

        local keymap_opts = {
            noremap = true,
            silent = true,
        }

        -- Add/remove current file.
        vim.keymap.set("n", "<leader>m", grapple.toggle, keymap_opts)

        -- Open/close tag list.
        vim.keymap.set("n", "<leader>M", grapple.toggle_tags, keymap_opts)

        -- Jump to Grapple tags by index.
        vim.keymap.set("n", "<leader>1", "<cmd>Grapple select index=1<cr>", keymap_opts)
        vim.keymap.set("n", "<leader>2", "<cmd>Grapple select index=2<cr>", keymap_opts)
        vim.keymap.set("n", "<leader>3", "<cmd>Grapple select index=3<cr>", keymap_opts)
        vim.keymap.set("n", "<leader>4", "<cmd>Grapple select index=4<cr>", keymap_opts)
        vim.keymap.set("n", "<leader>5", "<cmd>Grapple select index=5<cr>", keymap_opts)
    end,
}
