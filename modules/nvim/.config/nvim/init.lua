-- Leader keys must be set before any keymaps or plugins define mappings
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Core settings
require('config.options')

-- Plugin manager
-- Imports lua/plugins/*.lua through lazy.nvim
require('config.lazy')

-- General keymaps not owned by plugins
require('config.keymaps')

