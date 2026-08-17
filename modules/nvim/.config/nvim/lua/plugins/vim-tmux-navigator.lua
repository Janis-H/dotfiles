-- Navigate seamlessly between Neovim and tmux panes
return {
    "christoomey/vim-tmux-navigator",
    lazy = false,

    -- The default mappings are replaced by after/plugin/vim_tmux_herdr_navigation.lua.
    init = function()
        vim.g.tmux_navigator_no_mappings = 1
    end,
}
