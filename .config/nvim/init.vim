set guicursor=
set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

"***** PLUGINS *****
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'loctvl842/monokai-pro.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim'
call plug#end()

"***** COLOR SCHEME: *****
set termguicolors    " enable true colors support

" Color Scheme:: ayu
"let ayucolor="dark"  " for dark version of theme
"colorscheme ayu

" Color Scheme:: gruvbox
set background=dark
colorscheme gruvbox

" Color Scheme:: monokai-pro
" colorscheme monokai-pro
" colorscheme monokai-pro-octagon

" Color Scheme:: slate
" colorscheme slate

"***** RAMAPS *****
let mapleader = " "
" Normal Mode Memaps:
"source vim file
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
"vertical explorer
nnoremap <leader>pv :Vex<CR>
"horizontal explorer  
nnoremap <leader>ps :Sex<CR>
"open git project files
nnoremap <C-p> :GFiles<CR> 
"open files
nnoremap <M-p> :Files<CR>
"next in quickfix list
nnoremap <C-j> :cnext<CR>
"prev in quickfix list
nnoremap <C-k> :cprev<CR>
"clear highlighted search
nnoremap <leader>cl :nohls<CR>
"create new line and paste copied text 
nnoremap <leader>p o<ESC>Pk<CR>
"write to file
nnoremap <leader>s :w<CR>
"enter select window mode
nnoremap <leader>w <C-w>
"yank into system clipboard (need to use motions afterwards)
nnoremap <leader>y "+y
"yank entire file into system clipboard
nnoremap <leader>Y gg"+yG
"telescope plugin find_files - list files in current directory
nnoremap <leader>ff :Telescope find_files<CR>
"telescope git files - fuzzy seach git ls-files
nnoremap <leader>gf :Telescope git_files<CR>
"telescope plugin live_grep - search for string in current directory
nnoremap <leader>fg :Telescope live_grep<CR>
"telescope plugin oldfiles - lists previously open files
nnoremap <leader>fo :Telescope oldfiles<CR>
"telescope plugin buffers - lists open buffers in current neovim instance
nnoremap <leader>fb :Telescope buffers<CR>
"telescope plugin help_tags - lists available help tags
nnoremap <leader>fh :Telescope help_tags<CR>

" Visual Mode Remaps:
"delete current selection, yank to void register (to avoid replacing prev yank)
vnoremap <leader>p "_dp
"copy into system clipboard
vnoremap <leader>y "+y
"move code line up
vnoremap K :m '<-2<CR>gv=gv
"move code line down
vnoremap J :m '>+1<CR>gv=gv

" Archived Remaps:

" Plugin Configuration:
