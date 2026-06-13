return {
    -- Install and manage external tools for NeoVim
    {
        "mason-org/mason.nvim",
        opts = {},
    },

    -- Auto-install LSP servers listed by nvim-lspconfig name
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
            automatic_installation = true,
        },
    },
}
