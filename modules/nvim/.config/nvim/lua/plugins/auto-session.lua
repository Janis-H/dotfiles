-- Restore Neovim sessions automatically
return {
    "rmagatti/auto-session",

    lazy = false,

    keys = {
        { "<leader>ss", "<cmd>AutoSession save<cr>", desc = "Save session" },
        { "<leader>sr", "<cmd>AutoSession restore<cr>", desc = "Restore session" },
        { "<leader>sf", "<cmd>AutoSession search<cr>", desc = "Find session" },
        { "<leader>sd", "<cmd>AutoSession deletePicker<cr>", desc = "Delete session" },
        { "<leader>st", "<cmd>AutoSession toggle<cr>", desc = "Toggle session autosave" },
    },

    opts = {
        suppressed_dirs = {
            "~/",
            "~/Projects",
            "~/Downloads",
            "/"
        },
        session_lens = {
            picker = "telescope",
        },

        -- Keep sessions scoped by project directory.
        auto_save = true,
        auto_restore = true,
        auto_create = true,

        -- Optional: uncomment if you want seperate sessions per Git branch
        git_use_branch_name = true,

        -- log_level = 'debug',
    },

    config = function(_, opts)
        -- Recommended by auto-session for better restore behavior.
        -- vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
        vim.o.sessionoptions = "blank,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

        require("auto-session").setup(opts)
    end,
}
