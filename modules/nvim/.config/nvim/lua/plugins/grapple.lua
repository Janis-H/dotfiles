-- provides immediate navigation to important files
return {
    'cbochs/grapple.nvim',
    dependencies = {
        {
            'nvim-tree/nvim-web-devicons',
            lazy = true
         },
    },
    opts = {
        -- Decides which tag list grapple use
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
    },
    keys = {
        { '<leader>m', grapple.toggle, desc = 'add/remove current file' },
        { '<leader>M', grapple.toggle_tags, desc = 'open/close tag list') },

        -- jump to Grapple tags by index
        { '<leader>1', '<CMD>Grapple select index=1<CR>', desc = '') },
        { '<leader>2', '<CMD>Grapple select index=2<CR>', desc = '') },
        { '<leader>3', '<CMD>Grapple select index=3<CR>', desc = '') },
        { '<leader>4', '<CMD>Grapple select index=4<CR>', desc = '') },
        { '<leader>5', '<CMD>Grapple select index=5<CR>', desc = '') },
    },
}
