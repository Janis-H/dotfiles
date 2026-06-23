-- Adds Tree-sitter parsers for better syntax highlighting, indentation, and plugin integrations
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        ensure_installed = {
            -- Neovim / Lua
            "lua",
            "vim",
            "vimdoc",
            "query",

            -- Shell / dotfiles
            "bash",
            "zsh",
            "tmux",

            -- Web / TypeScript
            "javascript",
            "typescript",
            "tsx",
            "jsdoc",
            "html",
            "css",
            "scss",
            "json",
            "json5",
            "yaml",

            -- Docs
            "markdown",
            "markdown_inline",

            -- Backend / scripting
            "python",
            "sql",
            "dockerfile",

            -- Config formats
            "toml",
            "ini",
        },

        highlight = {
            enable = true,
        },

        indent = {
            enable = true,
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
