return {
    'stevearc/oil.nvim',
    opts = {
        default_file_explorer = true,

        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,

        view_options = {
            show_hidden = true,
            natural_order = 'fast',
            sort = {
                { 'type', 'asc' },
                { 'name', 'asc' },
            },
        },

        keymaps = {},
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    lazy = false,
    keys = {
        { '-', '<cmd>Oil<cr>', desc = 'Open parent directory' },
        { '<leader>e', '<cmd>Oil .<cr>', desc = 'Open oil at cwd' },

         -- Like :Sex
        { "<leader>se", "<cmd>split | Oil<CR>", desc = "Open Oil in horizontal split" },

        -- Like :Vex
        { "<leader>ve", "<cmd>vsplit | Oil<CR>", desc = "Open Oil in vertical split" },
    },
}
