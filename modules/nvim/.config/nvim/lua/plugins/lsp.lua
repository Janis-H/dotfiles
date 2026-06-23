-- Installs, configures, and enables language servers
local server_names = {
    -- Lua / Neovim
    "lua_ls",

    -- Web / TypeScript
    "ts_ls",
    "eslint",
    "html",
    "cssls",
    "jsonls",

    -- Config / docs
    "yamlls",
    "marksman",

    -- TOML files
    "taplo",

    -- Shell
    "bashls",

    -- Python
    "pyright",
    "ruff",

    -- SQL
    "sqlls",

    -- Docker
    "dockerls",
    "docker_compose_language_service",

    -- Go
    "gopls",

    -- Java
    "jdtls",

    -- Rust
    "rust_analyzer",

    -- C / C++
    "clangd",
}

local function get_server_configs()
    local schemastore = require("schemastore")

    return {
        lua_ls = {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        },
        jsonls = {
            settings = {
                json = {
                    schemas = schemastore.json.schemas(),
                    validate = { enable = true },
                },
            },
        },
        yamlls = {
            settings = {
                yaml = {
                    schemaStore = {
                        enable = false,
                        url = "",
                    },
                    schemas = schemastore.yaml.schemas(),
                    validate = true,
                    completion = true,
                    hover = true,
                },
            },
        },
        pyright = {
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "basic",
                    },
                },
            },
        },
    }
end

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
        },
        opts = {
            ensure_installed = server_names,
            automatic_installation = true,
            automatic_enable = false,
        },
    },

    -- Configure and enable Neovim language servers.
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "mason-org/mason-lspconfig.nvim",
            "b0o/schemastore.nvim",
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local server_configs = get_server_configs()

            -- Register each server with optional config and shared completion capabilities
            for _, server in ipairs(server_names) do
                local server_config = server_configs[server] or {}

                local config = vim.tbl_deep_extend('force', {}, server_config, {
                    capabilities = capabilities,
                })

                vim.lsp.config(server, config)
            end

            -- Enable every server from the install list
            vim.lsp.enable(server_names)
        end,
    }
}
