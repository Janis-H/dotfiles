-- TODO: seperate nvim init.lua into modules
-- TODO: consider swapping from Plug to LazyNvim for plugin management

-- Basic settings:
vim.opt.background = dark
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.guicursor = ""
vim.opt.history = 1000
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 4
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4 
vim.opt.termguicolors = true -- enable true colors support
vim.opt.title = true
vim.opt.wildmenu = true
vim.opt.wrap = true

-- Synax highlighting and filetype plugins
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

-- Plugins:
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- provides immediate navigation to important files
Plug('cbochs/grapple.nvim') 

-- tmux navigator
Plug('christoomey/vim-tmux-navigator')

-- fuzzy finder
Plug('junegunn/fzf', { ['do'] = function () 
    vim.fn['fzf#install']()
end })

-- fuzzy finder for vim
Plug('junegunn/fzf.vim') 

-- colorscheme
Plug('ellisonleao/gruvbox.nvim') 

-- completion engine for neovim
Plug('hrsh7th/nvim-cmp') 

-- lazygit for nvim
Plug("kdheepak/lazygit.nvim")

-- autocomplete
Plug('neoclide/coc.nvim', { ['branch'] = 'release'} )

-- lua functions that many plugins use
Plug('nvim-lua/plenary.nvim') 

-- fuzzy finder over lists
Plug('nvim-telescope/telescope.nvim') 

-- improved sorting for telescope
Plug("nvim-telescope/telescope-fzf-native.nvim", {
  ["do"] = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install"
})

-- project specific commands
Plug('ThePrimeagen/harpoon', { ['branch'] = 'harpoon2' }) 

-- comment stuff out with gcc
Plug('tpope/vim-commentary') 

-- git commands with :Git or :G
Plug('tpope/vim-fugitive') 

-- mappings for easy deleting, changing and adding surrounding pairs
Plug('tpope/vim-surround') 

-- end Plug plugin declaration
vim.call('plug#end')

-- Plugin setup
require("plugins.telescope")

-- TODO: setup harpoon
--           reference link: https://deepwiki.com/ThePrimeagen/harpoon/1.1-installation-and-setup

-- Color Scheme: 
vim.cmd.colorscheme("gruvbox")

-- Basic remaps:
local opts = { noremap = true }

-- leader key
vim.g.mapleader = " " -- Space as the leader key

-- write to file
vim.keymap.set('n', '<leader><leader>', ':w<CR>', opts)
-- source vim file
vim.keymap.set('n', '<leader><CR>', ':so ~/.config/nvim/init.lua<CR>', opts)
-- vertical explorer
vim.keymap.set('n', '<leader>v', ':Vex<CR>', opts)
-- horizontal explorer  
vim.keymap.set('n', '<leader>s', ':Sex<CR>', opts)

-- TODO: Replace C-j and C-k for next and prev in quickfix list
-- next in quickfix list
-- vim.keymap.set('n', '<C-j>', ':cnext<CR>', opts)
-- prev in quickfix list
-- vim.keymap.set('n', '<C-k>', ':cprev<CR>', opts)

-- clear highlighted search
vim.keymap.set('n', '<leader>cl', ':nohls<CR>', opts)
-- create new line and paste copied text 
vim.keymap.set('n', '<leader>p', 'o<ESC>Pk<CR>', opts)
-- yank into system clipboard (need to use motions afterwards)
vim.keymap.set('n', '<leader>y', '"+y', opts)
-- yank entire file into system clipboard
vim.keymap.set('n', '<leader>Y', 'gg"+yG', opts)
-- delete current selection, yank to void register (to avoid replacing prev yank)
vim.keymap.set('v', '<leader>p', '"_dp', opts)
-- copy into system clipboard
vim.keymap.set('v', '<leader>y', '"+y', opts)
-- move line up
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)
-- move line down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)

-- Plugin: Telescope remaps
-- telescope plugin find_files - list files in current directory
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', opts)
-- telescope git files - fuzzy seach git ls-files
vim.keymap.set('n', '<leader>gg', ':Telescope git_files<CR>', opts)
-- telescope plugin live_grep - search for string in current directory
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
-- telescope plugin oldfiles - lists previously open files
vim.keymap.set('n', '<leader>fo', ':Telescope oldfiles<CR>', opts)
-- telescope plugin buffers - lists open buffers in current neovim instance
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', opts)
-- telescope plugin help_tags - lists available help tags
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', opts)

-- Plugin: Fugitive remaps
-- git quick type
vim.keymap.set('n', '<leader>gi', ':Git ' , opts)
-- git add
vim.keymap.set('n', '<leader>ga', ':Git add .<CR>'  , opts)
-- git commit -m
vim.keymap.set('n', '<leader>gc', ':Git co "', opts)

-- Plugin: Lazygit remaps
vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', opts)

-- tmux-sessionizer
-- Ctrl-f opens the project picker
-- Alt bindings run TS_SESSION_COMMANDS by index in the active project session.
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<M-1>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>")
vim.keymap.set("n", "<M-2>", "<cmd>silent !tmux neww tmux-sessionizer -s 1<CR>")
vim.keymap.set("n", "<M-3>", "<cmd>silent !tmux neww tmux-sessionizer -s 2<CR>")
vim.keymap.set("n", "<M-4>", "<cmd>silent !tmux neww tmux-sessionizer -s 3<CR>")
