-- Sets filetypes for files Neovim may not detect correctly
vim.filetype.add({
    filename = {
        [".zshrc"] = "zsh",
        [".zprofile"] = "zsh",
        [".zshenv"] = "zsh",
        [".zlogin"] = "zsh",
    },
    extension = {
        rasi = "rasi",
        zsh = "zsh",
    },
    pattern = {
        [".*/%.config/ghostty/config$"] = "ghostty",
        [".*/sway/config"] = "swayconfig",
        [".*/sway/config%.d/.*"] = "swayconfig",
        [".*/sway/.*%.conf"] = "swayconfig",
        [".*/%.config/zsh/.*%.zsh"] = "zsh",
    },
})
