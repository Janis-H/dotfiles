-- Set the editor colorscheme
return {
    {
        'ellisonleao/gruvbox.nvim',
        lazy = false,
        name = 'gruvbox',

        -- Uncomment lines below to set colorscheme
        -- priority = 1000,
        -- config = function()
        --     vim.cmd.colorscheme('gruvbox')
        -- end,
    },
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        name = 'gruvbox-material',

        -- Uncomment lines below to set colorscheme
        priority = 1000,
        config = function()
            ---@enum "hard" | "medium" | "soft"
            ---@default "medium"
            vim.g.gruvbox_material_background = "hard"

            ---@enum "material" | "mix" | "original"
            ---@default "material"
            vim.g.gruvbox_material_foreground = "material"

            vim.g.gruvbox_material_enable_italic = true

            vim.cmd.colorscheme('gruvbox-material')
        end,
    },
}
