-- Render Markdown with better visual formatting
return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    ft = {
        "markdown",
    },
    opts = {},
}
