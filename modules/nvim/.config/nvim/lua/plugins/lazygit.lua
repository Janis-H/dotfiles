-- Open LazyGit from inside Neovim
return {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
        'LazyGit',
        'LazyGitConfig',
        'LazyGitCurrentFile',
        'LazyGitFilter',
        'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decorations
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    init = function()
        vim.g.lazygit_floating_window_winblend = 0
        vim.g.lazygit_floating_window_scaling_factor = 0.95
    end,
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { '<leader>lg', ':LazyGit<CR>', desc = 'Open LazyGit' },
    },
}
