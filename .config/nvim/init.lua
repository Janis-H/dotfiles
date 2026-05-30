-- BASIC SETTINGS: *************************
vim.opt.background = dark
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.guicursor = true 
vim.opt.history = 1000
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.softtabstop=4
vim.opt.tabstop = 4
vim.opt.termguicolors = true -- enable true colors support
vim.opt.wildmenu = true
vim.opt.wrap = true

vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

-- PLUGINS: *************************
-- TODO: grapple and harpoon are very alike. Find which one I prefer.
--           both are good for marking important files in directories for quick
--           access
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- provides immediate navigation to important files
Plug('cbochs/grapple.nvim') 

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
Plug('loctvl842/monokai-pro.nvim') -- colorscheme
Plug('neoclide/coc.nvim', { ['branch'] = 'release'} -- autocomplete
Plug('nvim-lua/plenary.nvim') -- lua functions that many plugins use
Plug('nvim-telescope/telescope.nvim') -- fuzzy finder over lists
Plug('nvim-telescope/telescope-fzf-native.nvim') -- improved sorting for telescope
Plug('ThePrimeagen/harpoon') -- project specific commands
Plug('tpope/vim-commentary') -- comment stuff out with gcc
Plug('tpope/vim-fugitive') -- git commands with :Git or :G
Plug('tpope/vim-surround') -- mappings for easy deleting, changing and adding surrounding pairs
vim.call('plug#end')

-- TODO: setup harpoon
--           reference link: https://deepwiki.com/ThePrimeagen/harpoon/1.1-installation-and-setup

-- COLOR SCHEME: 
local colorscheme_ok, _ = pcall(vim.cmd, [[colorscheme gruvbox]])
if not coloscheme_ok then
    print("Warning: gruvbox theme not found. Falling back to default theme.")
    return
end

vim.cmd.colorscheme("gruvbox")

-- Color Scheme: monokai-pro
-- vim.cmd.colorscheme("monokai-pro")
-- vim.cmd.colorscheme("monokai-pro-octagon")

-- RAMAPS: *************************
local opts = { noremap = true, silent = true }
vim.g.leader = " "
-- Normal Mode Memaps:
--write to file
vim.keymap.set('n', '<leader><leader>', ':w<CR>', opts)
--source vim file
vim.keymap.set('n', '<leader><CR>', ':so ~/.config/nvim/init.vim<CR>', opts)
--quit nvim
vim.keymap.set('n', '<leader>q', ':q<CR>', opts)
--vertical explorer
vim.keymap.set('n', '<leader>v', ':Vex<CR>', opts)
--horizontal explorer  
vim.keymap.set('n', '<leader>s', ':Sex<CR>', opts)
--next in quickfix list
vim.keymap.set('n', '<C-j>', ':cnext<CR>', opts)
--prev in quickfix list
vim.keymap.set('n', '<C-k>', ':cprev<CR>', opts)
--clear highlighted search
vim.keymap.set('n', '<leader>cl', ':nohls<CR>', opts)
--create new line and paste copied text 
vim.keymap.set('n', '<leader>p', 'o<ESC>Pk<CR>', opts)
--enter select window mode
vim.keymap.set('n', '<leader>w', '<C-w>', opts)
--yank into system clipboard (need to use motions afterwards)
vim.keymap.set('n', '<leader>y', '"+y', opts)
--yank entire file into system clipboard
vim.keymap.set('n', '<leader>Y', 'gg"+yG', opts)
--telescope git_files - fuzzy search git ls-files
vim.keymap.set('n', '<C-p>', ':Telescope git_files<CR>', opts)
--telescope find_files - list files in current directory
vim.keymap.set('n', '<M-p>', ':Telescope find_files<CR>', opts)
--telescope plugin find_files - list files in current directory
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', opts)
--telescope git files - fuzzy seach git ls-files
vim.keymap.set('n', '<leader>gg', ':Telescope git_files<CR>', opts)
--telescope plugin live_grep - search for string in current directory
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
--telescope plugin oldfiles - lists previously open files
vim.keymap.set('n', '<leader>fo', ':Telescope oldfiles<CR>', opts)
--telescope plugin buffers - lists open buffers in current neovim instance
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', opts)
--telescope plugin help_tags - lists available help tags
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', opts)
--git quick type
vim.keymap.set('n', '<leader>gi', ':Git' , opts)
--git add
vim.keymap.set('n', '<leader>ga', ':Git add'  , opts)
--git status
vim.keymap.set('n', '<leader>gs', ':Git ss<CR>', opts)
--git diff
vim.keymap.set('n', '<leader>gd', ':Git diff<CR>', opts)
--git log
vim.keymap.set('n', '<leader>gl', ':Git log<CR>', opts)
--git commit -m
vim.keymap.set('n', '<leader>gc', ':Git co "', opts)


-- Visual Mode Remaps: *************************
--delete current selection, yank to void register (to avoid replacing prev yank)
vim.keymap.set('v', '<leader>p', '"_dp', opts)
--copy into system clipboard
vim.keymap.set('v', '<leader>y', '"+y', opts)
--move line up
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)
--move line down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)

-- Insert Mode Remaps: *************************

-- Command Mode Remaps: *************************

-- Archived Remaps: *************************
