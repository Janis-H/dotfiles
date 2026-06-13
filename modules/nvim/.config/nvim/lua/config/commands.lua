-- Reload the main Neovim config
vim.api.nvim_create_user_command(
    'ReloadConfig',
    function()
        vim.cmd('source ~/.config/nvim/init.lua')
    end,
    {
        desc = 'Reload Neovim config',
    }
)

-- Clear search highlights
vim.api.nvim_create_user_command(
    'ClearSearch',
    function()
        vim.cmd("nohlsearch")
    end,
    {
        desc = 'Clear search highlights',
    }
)

-- Clear the quickfix list and close the quickfix window
vim.api.nvim_create_user_command(
    'ClearQuickfix',
    function()
        vim.cmd('cexpr []')
        vim.cmd('cclose')
    end, 
    {
        desc = 'Clear quickfix list',
    }
)


-- Trim trailing whitespace in the current file
vim.api.nvim_create_user_command(
    'TrimWhitespace',
    function()
        local view = vim.fn.winsaveview()

        vim.cmd([[%s/\s\+$//e]])

        vim.fn.winrestview(view)
    end,
    {
        desc = 'Trim trailing whitespace',
    }
)
