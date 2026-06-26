-- Framework for interacting with tests within NeoVim
return {
    {
        "nvim-neotest/neotest",
        -- enabled = false,
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",

            -- adapters
            "nvim-neotest/neotest-jest",
        },
        keys = {
            { "<leader>nr", "<cmd>Neotest run<cr>" },
            { "<leader>ni", "<cmd>Neotest output<cr>" },
            { "<leader>ns", "<cmd>Neotest summary<cr>" },
            { "<leader>na", "<cmd>lua require('neotest').run.run({ suite = true })<cr>" },
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-jest")({
                        jestCommand = "npm test --",
                        jestArguments = function(defaultArguments, context)
                            return defaultArguments
                        end,
                        jestConfigFile = "custom.jest.config.ts",
                        env = { CI = true },
                        cwd = function(path)
                            return vim.fn.getcwd()
                        end,
                        isTestFile = require("neotest-jest.jest-util").defaultIsTestFile,
                    }),
                },
            })
        end,
    },
}
