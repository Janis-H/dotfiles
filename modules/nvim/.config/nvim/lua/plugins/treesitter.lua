-- Adds Tree-sitter parsers for better syntax highlighting, indentation, and plugin integrations

-- Use vim syntax for shell files
-- because treesitter highlighting looks worse
local disabled = {
    -- bash = false,
    -- sh = false,
    -- zsh = false,
}

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        local treesitter = require("nvim-treesitter")

        treesitter.setup({
            install_dir = vim.fn.stdpath("data") .. "/site",
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
        }

        treesitter.install(ensure_installed)

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local ft = vim.bo[args.buf].filetype


                -- Fall back to Vim syntax for filetypes where Tree-sitter is disabled
                if disabled[ft] then
                    vim.cmd("syntax enable")
                    vim.cmd("setlocal syntax=" .. ft)
                    return
                end

                pcall(vim.treesitter.start, args.buf)
            end,
        })
    end,
}
