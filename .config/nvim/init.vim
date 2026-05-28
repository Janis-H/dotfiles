"***** BASIC SETTINGS *****
set guicursor=
set scrolloff=10
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

syntax on

filetype plugin indent on

"***** PLUGINS *****
" TODO: grapple and harpoon are very alike. Find which one I prefer.
"           both are good for marking important files in directories for quick
"           access
call plug#begin('~/.vim/plugged')
Plug 'cbochs/grapple.nvim' "provides immeidate navigation to important files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "fuzzy finder
Plug 'junegunn/fzf.vim' "fuzzy finder for vim
Plug 'ellisonleao/gruvbox.nvim' "colorscheme
Plug 'hrsh7th/nvim-cmp' "completion engine for neovim
Plug 'loctvl842/monokai-pro.nvim' "colorscheme
Plug 'nvim-lua/plenary.nvim' "lua functions that many plugins use
Plug 'nvim-telescope/telescope.nvim' "fuzzy finder over lists
Plug 'nvim-telescope/telescope-fzf-native.nvim' "improved sorting for telescope
Plug 'ThePrimeagen/harpoon' "project specific commands
Plug 'tpope/vim-fugitive' "git commands with :Git or :G
Plug 'tpope/vim-commentary' "comment stuff out with gcc
call plug#end()

" TODO: setup harpoon
"           reference link: https://deepwiki.com/ThePrimeagen/harpoon/1.1-installation-and-setup

"***** COLOR SCHEME: *****
set termguicolors    " enable true colors support

" Color Scheme: gruvbox
set background=dark
colorscheme gruvbox

" Color Scheme: monokai-pro
" colorscheme monokai-pro
" colorscheme monokai-pro-octagon

"***** RAMAPS *****
let mapleader = " "
" Normal Mode Memaps:
"write to file
nnoremap <leader><leader> :w<CR>
"source vim file
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
"exit vim
" nnoremap <C-e> <Esc>
"quit nvim
nnoremap <leader>q :q<CR>
"vertical explorer
nnoremap <leader>v :Vex<CR>
"horizontal explorer  
nnoremap <leader>s :Sex<CR>
"next in quickfix list
nnoremap <C-j> :cnext<CR>
"prev in quickfix list
nnoremap <C-k> :cprev<CR>
"clear highlighted search
nnoremap <leader>cl :nohls<CR>
"create new line and paste copied text 
nnoremap <leader>p o<ESC>Pk<CR>
"enter select window mode
nnoremap <leader>w <C-w>
"yank into system clipboard (need to use motions afterwards)
nnoremap <leader>y "+y
"yank entire file into system clipboard
nnoremap <leader>Y gg"+yG
"telescope git_files - fuzzy search git ls-files
nnoremap <C-p> :Telescope git_files<CR>
"telescope find_files - list files in current directory
nnoremap <M-p> :Telescope find_files<CR>
"telescope plugin find_files - list files in current directory
nnoremap <leader>ff :Telescope find_files<CR>
"telescope git files - fuzzy seach git ls-files
nnoremap <leader>gg :Telescope git_files<CR>
"telescope plugin live_grep - search for string in current directory
nnoremap <leader>fg :Telescope live_grep<CR>
"telescope plugin oldfiles - lists previously open files
nnoremap <leader>fo :Telescope oldfiles<CR>
"telescope plugin buffers - lists open buffers in current neovim instance
nnoremap <leader>fb :Telescope buffers<CR>
"telescope plugin help_tags - lists available help tags
nnoremap <leader>fh :Telescope help_tags<CR>

" Visual Mode Remaps:
"escape visual mode
" vnoremap <C-e> <Esc>
"delete current selection, yank to void register (to avoid replacing prev yank)
vnoremap <leader>p "_dp
"copy into system clipboard
vnoremap <leader>y "+y
"move line up
vnoremap K :m '<-2<CR>gv=gv
"move line down
vnoremap J :m '>+1<CR>gv=gv

" Insert Mode Remaps:
"escape insert mode
" inoremap <C-e> <Esc>

" Command Mode Remaps:
"escape command mode              
" cnoremap <C-e> <Esc>

" Archived Remaps:
