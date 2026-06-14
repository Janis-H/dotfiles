-- Pick and reload one Lazy plugin spec without restarting Neovim
-- Context:
    -- lazy.nvim does not support sourcing init.lua, so reload plugin specs through Lazy
vim.api.nvim_create_user_command(
    "LazyReloadPlugin",
    function()
        local plugins = require("lazy.core.config").plugins
        local names = vim.tbl_keys(plugins)

        table.sort(names)

        vim.ui.select(
            names,
            {
                prompt = "Reload Lazy plugin:",
            },
            function(choice)
                if not choice then
                    return
                end

                vim.cmd("Lazy reload " .. choice)
            end
        )
end, {})

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
