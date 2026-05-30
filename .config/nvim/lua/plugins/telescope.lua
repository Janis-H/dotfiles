require('telescope').setup{
    defaults = {
        -- configure to use ripgrep
        vimgrep_arguments = {
            'rg',
            '--follow', -- Follow symbolic links
            '--hidden', -- Search for hidden files
            '--no-heading', -- Don't gropu matches by each file
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
        }
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
            }
        },
        live_grep = {
            additional_args = function(_ts)
                return {"--hidden"}
            end
        },
    },
    -- default filter ignore pattern
    file_ignore_patterns = {
        "node_modules", "build", "dist", "package-lock.json", "yarn.lock"
    }
}
