return {
    {
        'ellisonleao/gruvbox.nvim',
        name = 'gruvbox',

        -- move these into the table for whicher colorscheme is currently active
        priority = 1000,
        config = function()
            vim.cmd.colorscheme('gruvbox')
        end,
    },
}
