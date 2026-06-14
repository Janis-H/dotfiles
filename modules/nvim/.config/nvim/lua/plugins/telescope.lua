-- Fuzzy find files, text, buffers, help, and more
return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            "nvim-telescope/telescope-live-grep-args.nvim" ,
            -- This will not install any breaking changes.
            -- For major updates, this must be adjusted manually.
            version = "^1.0.0",
        },
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install'
        },
    },
    config = function()
        local telescope = require("telescope")

        -- first setup telescope
        telescope.setup({
            defaults = {
                -- configure telescope window + preview
                layout_strategy = "horizontal",
                layout_config = {
                    width = 0.95,
                    height = 0.9,
                    horizontal = {
                        preview_width = 0.55,
                        preview_cutoff = 1,
                    },
                },

                -- close telescope window with C-c
                mappings = {
                    i = {
                        ['C-c'] = require('telescope.actions').close,
                    },
                    n = {
                        ['C-c'] = require('telescope.actions').close,
                    },
                },

                -- default filter ignore pattern
                file_ignore_patterns = {
                    "node_modules",
                    "build",
                    "dist",
                    "package-lock.json",
                    "yarn.lock",
                },

                -- configure to use ripgrep
                vimgrep_arguments = {
                    'rg',
                    '--color=never', -- Disable ANSI color codes
                    '--column', -- Include the match column number
                    '--no-heading', -- Don't group matches by each file
                    '--follow', -- Follow symbolic links
                    '--hidden', -- Search for hidden files
                    '--with-filename', -- Print the file path with the matched lines
                    '--line-number', -- Show line numbers
                    '--smart-case', -- Smart case search

                    -- Exclude some patterns from search
                    "--glob=!**/.git/*",
                    "--glob=!**/.idea/*",
                    "--glob=!**/.vscode/*",
                    "--glob=!**/node_modules/*",
                    "--glob=!**/build/*",
                    "--glob=!**/dist/*",
                    "--glob=!**/yarn.lock",
                    "--glob=!**/package-lock.json",
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                    -- needed to exclude some files & dirs from general search
                    -- when not included or specified in .gitignore
                    find_command = {
                        "rg",
                        "--files",
                        "--hidden",
                        "--glob=!**/.git/*",
                        "--glob=!**/.idea/*",
                        "--glob=!**/.vscode/*",
                        "--glob=!**/node_modules/*",
                        "--glob=!**/build/*",
                        "--glob=!**/dist/*",
                        "--glob=!**/yarn.lock",
                        "--glob=!**/package-lock.json",
                    },
                },
            },
        })

        -- then load the extension
        telescope.load_extension("live_grep_args")
        telescope.load_extension("fzf")
    end,
    keys = {
        -- File and text search.
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Search text" },
        {
            "<leader>/",
            function()
                require("telescope.builtin").current_buffer_fuzzy_find()
            end,
            desc = "Fuzzy find in current buffer",
        },

        -- Git-aware file picker. Only shows git-tracked files.
        { "<leader>gg", "<cmd>Telescope git_files<cr>", desc = "Find git files" },

        -- Recently opened files and buffers.
        { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Find recent files" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },

        -- Neovim help and command discovery.
        { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find help tags" },
        { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find keymaps" },
        { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Find commands" },

        -- Quickfix.
        { "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "Find quickfix" },
    },
}
