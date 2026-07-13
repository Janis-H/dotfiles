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
            "query",
            "vim",
            "vimdoc",

            -- Shell / dotfiles
            "bash",
            "tmux",
            "zsh",

            -- Git
            "diff",
            "git_config",
            "git_rebase",
            "gitattributes",
            "gitcommit",
            "gitignore",

            -- Web
            "css",
            "html",
            "javascript",
            "jsdoc",
            "json",
            "json5",
            "scss",
            "tsx",
            "typescript",
            "yaml",

            -- Dart / Flutter
            "dart",

            -- Documentation
            "markdown",
            "markdown_inline",
            "mermaid",

            -- Backend / scripting
            "php",
            "phpdoc",
            "python",
            "ruby",
            "sql",

            -- Sytems and compiled languages
            "c",
            "cpp",
            "go",
            "gomod",
            "gosum",
            "gowork",
            "java",
            "rust",

            -- Build and project files
            "cmake",
            "dockerfile",
            "editorconfig",
            "make",

            -- Config formats
            "toml",
            "ini",

            -- Application configuration
            "ghostty",
            "rasi",
        },
        auto_install = true,
    },
}
