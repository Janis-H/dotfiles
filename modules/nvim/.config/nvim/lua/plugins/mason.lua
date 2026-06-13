return {
    -- Install and manage external tools for NeoVim
    {
        "mason-org/mason.nvim",
        opts = {},
    },

    -- Connect Mason-installed LSP servers to nvim-lspconfig
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = {
                "lua_ls",
                "ts_ls",
                "eslint",
                "jsonls",
                "bashls",
                "pyright",
                "ruff",
            },
        },
    },
}
