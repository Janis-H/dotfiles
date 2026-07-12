-- Installs Tree-sitter parsers and enables Tree-sitter syntax highlighting

return {
    "romus204/tree-sitter-manager.nvim",
    -- TODO: enable tree-sitter-manager once nvim-treesitter is removed
    enabled = false,
    lazy = false,
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

            -- Go / Java
            "go",
            "gomod",
            "gosum",
            "gowork",
            "java",

            -- Other common languages
            "rust",
            "c",
            "cpp",
        },
        auto_install = true,
    },
}
