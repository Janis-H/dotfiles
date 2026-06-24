-- git commands with :Git or :G
return {
    'tpope/vim-fugitive',
    keys = {
        { '<leader>g:', ':G' , desc = 'Fugitive Git command' },
        { '<leader>gs', '<cmd>Git<cr>', desc = 'Git status' },
        { '<leader>gb', '<cmd>Git blame<cr>', desc = 'Git blame' },
        { '<leader>gc', '<cmd>Git commit<cr>', desc = 'Git blame' },
        { '<leader>gd', '<cmd>Gdiffsplit<cr>', desc = 'Git diff' },
    },
}
