-- Configure and enable Neovim LSP servers.
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "mason-org/mason-lspconfig.nvim",
    },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- servers are installed via Mason
        local servers = {
            "lua_ls",
            "ts_ls",
            "eslint",
            "jsonls",
            "bashls",
            "pyright",
            "ruff",
            "marksman",
        }

        for _, server in ipairs(servers) do
            vim.lsp.config(server, {
                capabilities = capabilities,
            })
        end

        vim.lsp.enable(servers)
    end,
}
