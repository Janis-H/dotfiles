-- Reload the main Neovim config
-- Context:
    -- lazy.nvim does not support sourcing init.lua, and require() caches modules
    -- Clear and re-require config files to apply changes without restarting
vim.api.nvim_create_user_command(
    "ReloadConfig",
    function()
        for name, _ in pairs(package.loaded) do
            if name:match("^config%.") then
                package.loaded[name] = nil
            end
        end

        -- require() caches Lua modules, so re-require config files after clearing them
        require('config.options')
        require('config.keymaps')
        require('config.autocommands')
        require('config.commands')

        vim.notify("Reloaded Neovim config")
    end,
    {}
)

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
