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

            -- Project files
            "editorconfig",
            "cmake",
            "make",

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
        }

        treesitter.install(ensure_installed)

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                pcall(vim.treesitter.start, args.buf)
            end,
        })
    end,
}
