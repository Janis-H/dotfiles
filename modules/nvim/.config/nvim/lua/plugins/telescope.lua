local telescope = require("telescope")

telescope.setup({
    defaults = {
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                preview_width = 0.55,
                preview_cutoff = 1,
            },
        },

        -- configure to use ripgrep
        vimgrep_arguments = {
            'rg',
            '--color=never', -- Disable ANSI color codes so Telescope can parse ripgrep output
            '--column', -- Include the match column number; Telescope uses this for result locations
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
        live_grep = {
            additional_args = function(opts)
                return {"--hidden"}
            end
        },
    },
    -- default filter ignore pattern
    file_ignore_patterns = {
        "node_modules", "build", "dist", "package-lock.json", "yarn.lock"
    },
})

telescope.load_extension("fzf")
