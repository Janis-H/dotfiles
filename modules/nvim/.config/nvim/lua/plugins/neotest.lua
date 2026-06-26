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
            "nvim-neotest/neotest-python",
            "adrigzr/neotest-mocha",
            "thenbe/neotest-playwright",
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
                    require('neotest-mocha')({
                        command = "npm test --",
                        command_args = function(context)
                            -- The context contains:
                            --   results_path: The file that json results are written to
                            --   test_name: The exact name of the test; is empty for `file` and `dir` position tests.
                            --   test_name_pattern: The generated pattern for the test
                            --   path: The path to the test file
                            --
                            -- It should return a string array of arguments
                            --
                            -- Not specifying 'command_args' will use the defaults below
                            return {
                                "--full-trace",
                                "--reporter=json",
                                "--reporter-options=output=" .. context.results_path,
                                "--grep=" .. context.test_name_pattern,
                                context.path,
                            }
                        end,
                        env = { CI = true },
                        cwd = function(path)
                            return vim.fn.getcwd()
                        end,
                    }),
                    require("neotest-python")({
                        -- Extra arguments for nvim-dap configuration
                        -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
                        dap = { justMyCode = false },
                        -- Command line arguments for runner
                        -- Can also be a function to return dynamic values
                        args = {"--log-level", "DEBUG"},
                        -- Runner to use. Will use pytest if available by default.
                        -- Can be a function to return dynamic value.
                        runner = "pytest",
                        -- Custom python path for the runner.
                        -- Can be a string or a list of strings.
                        -- Can also be a function to return dynamic value.
                        -- If not provided, the path will be inferred by checking for
                        -- virtual envs in the local directory and for Pipenev/Poetry configs
                        python = ".venv/bin/python",
                        -- Returns if a given file path is a test file.
                        -- NB: This function is called a lot so don't perform any heavy tasks within it.
                        is_test_file = function(file_path)
                            -- TODO: find configuration for this function
                        end,
                        -- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
                        -- instances for files containing a parametrize mark (default: false)
                        pytest_discover_instances = true,
                    }),
                    require('neotest-playwright').adapter({
                        options = {
                            persist_project_selection = true,
                            enable_dynamic_test_discovery = true,
                        },
                    }),
                },
            })
        end,
    },
}
