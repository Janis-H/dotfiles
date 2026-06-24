-- Leader keys must be set before any keymaps or plugins define mappings
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Core settings
require('config.options')

-- Custom filetypes
require('config.filetypes')

-- Plugin manager
-- Imports lua/plugins/*.lua through lazy.nvim
require('config.lazy')

-- Custom :Commands
require('config.commands')

-- Event-based behavior
require('config.autocommands')

-- General keymaps not owned by plugins
require('config.keymaps')
