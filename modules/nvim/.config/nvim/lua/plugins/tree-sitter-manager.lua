-- Installs Tree-sitter parsers and enables Tree-sitter syntax highlighting

return {
    "romus204/tree-sitter-manager.nvim",
    -- TODO: enable tree-sitter-manager once nvim-treesitter is removed
    enabled = false,
    lazy = false,
    opts = {
        -- Parsers not included in tree-sitter-manager's repository registry
        languages = {
            make = {
                install_info = {
                    url = "https://github.com/tree-sitter-grammars/tree-sitter-make",
                },
            },
            mermaid = {
                install_info = {
                    url = "https://github.com/monaqa/tree-sitter-mermaid",
                },
            },
            rasi = {
                install_info = {
                    url = "https://github.com/Fymyte/tree-sitter-rasi",
                },
            },
        },

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

            -- Git
            "git_config",
            "git_rebase",
            "gitattributes",
            "gitcommit",
            "gitignore",
            "diff",

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
            "mermaid",

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

            -- Project files
            "editorconfig",
            "cmake",
            "make",

            -- Personal tooling
            "ghostty",
            "rasi",

            -- Other common languages
            "rust",
            "c",
            "cpp",
        },
        auto_install = true,
    },
}
