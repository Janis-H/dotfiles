-- TODO: seperate nvim init.lua into modules
-- TODO: consider swapping from Plug to LazyNvim for plugin management

-- Leader keys
-- Must be set before any keymaps or plugins define mappings
vim.g.mapleader = " " -- Space as the leader key
vim.g.maplocalleader = "\\"

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

-- icons
Plug('nvim-tree/nvim-web-devicons')

-- comment stuff out with gcc
Plug('tpope/vim-commentary') 

-- git commands with :Git or :G
Plug('tpope/vim-fugitive') 

-- mappings for easy deleting, changing and adding surrounding pairs
Plug('tpope/vim-surround') 

-- end Plug plugin declaration
vim.call('plug#end')

-- Color Scheme: 
vim.cmd.colorscheme("gruvbox")

-- Basic remaps:
local function opts(desc)
    return {
        noremap = true,
        -- silent = true,
        desc = desc,
    }
end

-- Plugin setup:
require("plugins.grapple")
require("plugins.telescope")

-- Basic Remaps:
vim.keymap.set('n', '<leader><leader>', ':w<CR>', opts('Write to file'))
vim.keymap.set('n', '<leader><CR>', ':so ~/.config/nvim/init.lua<CR>', opts('Source init.lua'))
vim.keymap.set('n', '<leader>v', ':Vex<CR>', opts('Vertical explorer'))
vim.keymap.set('n', '<leader>s', ':Sex<CR>', opts('Horizontal explorer'))
vim.keymap.set("n", "<leader>co", "<cmd>copen<cr>", opts("Open quickfix"))
vim.keymap.set("n", "<leader>cn", "<cmd>cnext<cr>", opts("Next quickfix item"))
vim.keymap.set("n", "<leader>cp", "<cmd>cprev<cr>", opts("Previous quickfix item"))
vim.keymap.set("n", "<leader>cq", "<cmd>cexpr []<cr><cmd>cclose<cr>", opts("Clear quickfix"))
vim.keymap.set('n', '<leader>cl', ':nohls<CR>', opts('Clear highlighted search'))
vim.keymap.set("v", "<leader>d", '"_d', opts("Delete selection without yanking it"))
vim.keymap.set('v', '<leader>p', '"_dp', opts('Delete current selection, yank into void register (to avoid replacing prev yank)'))
vim.keymap.set('n', '<leader>P', 'o<ESC>Pk<CR>', opts('Create new line and paste copied text'))
vim.keymap.set('n', '<leader>y', '"+y', opts('Yank into system clipboard'))
vim.keymap.set('n', '<leader>Y', 'gg"+yG', opts('Yank entire file into system clipboard'))
vim.keymap.set('v', '<leader>y', '"+y', opts('Copy into system keyboard'))
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts('Move line up'))
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts('Move line down'))

-- Plugin: Telescope remaps
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', opts('Find files'))
vim.keymap.set('n', '<leader>gg', ':Telescope git_files<CR>', opts('Find git files'))
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', opts('Search Text'))
vim.keymap.set('n', '<leader>fo', ':Telescope oldfiles<CR>', opts('Find recent files'))
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', opts('Find buffers'))
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', opts('Find help tags'))

-- Plugin: Fugitive remaps
vim.keymap.set('n', '<leader>g:', ':G' , opts('Fugitive Git command'))
vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>", opts("Git status"))
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>", opts("Git blame"))
vim.keymap.set("n", "<leader>gd", "<cmd>Gdiffsplit<cr>", opts("Git diff"))

-- Plugin: Lazygit remaps
vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', opts('Open lazygit'))

-- tmux-sessionizer
-- Ctrl-f opens the project picker
-- Alt bindings run TS_SESSION_COMMANDS by index in the active project session.
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", opts('Opens tmux-sessionizer project picker'))
vim.keymap.set(
    "n", 
    "<M-1>", 
    "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>",
    opts('Runs TS_SESSION_COMMANDS[0]')
)
vim.keymap.set(
    "n", 
    "<M-2>", 
    "<cmd>silent !tmux neww tmux-sessionizer -s 1<CR>",
    opts('Runs TS_SESSION_COMMANDS[1]')
)
vim.keymap.set(
    "n", 
    "<M-3>", 
    "<cmd>silent !tmux neww tmux-sessionizer -s 2<CR>",
    opts('Runs TS_SESSION_COMMANDS[2]')
)
vim.keymap.set(
    "n", 
    "<M-4>", 
    "<cmd>silent !tmux neww tmux-sessionizer -s 3<CR>",
    opts('Runs TS_SESSION_COMMANDS[3]')
)
