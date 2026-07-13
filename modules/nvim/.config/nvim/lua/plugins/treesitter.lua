-- Adds Tree-sitter parsers for better syntax highlighting, indentation, and plugin integrations

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    -- TODO: disable once tree-sitter-manager transition is over
    enabled = true,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        local treesitter = require("nvim-treesitter")

        treesitter.setup({
            install_dir = vim.fn.stdpath("data") .. "/site",
        })

        local function register_ghostty()
            require("nvim-treesitter.parsers").ghostty = {
                install_info = {
                    url = "https://github.com/bezhermoso/tree-sitter-ghostty",
                    revision = "7f41507014534e5f72d16e4639c0346d0adb8054",
                    queries = "queries/ghostty",
                },
            }
        end

        register_ghostty()

        -- Re-register the custom parser after nvim-treesitter updates its registry
        vim.api.nvim_create_autocmd("User", {
            pattern = "TSUpdate",
            callback = register_ghostty,
        })

        local ensure_installed = {
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
        }

        treesitter.install(ensure_installed)

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                pcall(vim.treesitter.start, args.buf)
            end,
        })
    end,
}
