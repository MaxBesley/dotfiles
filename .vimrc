"          _
"  __   __(_) _ __ ___   _ __  ___
"  \ \ / /| || '_ ` _ \ | '__|/ __|
"   \ V / | || | | | | || |  | (__
"    \_/  |_||_| |_| |_||_|   \___|
"
" In this single file is my Vim config.
" This setup is intended for writing prose
" using Vim, like a very minimalistic yet
" powerful digital typewriter. It is not
" intended for programming.



" vim-plug
if ! filereadable(expand("~/.vim/autoload/plug.vim"))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.vim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.vim/autoload/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/goyo.vim'
call plug#end()


" Options
set number relativenumber
set splitbelow splitright
set autoindent expandtab tabstop=2 shiftwidth=2
set noswapfile
set hlsearch
set wrap
set textwidth=79
"set spell spelllang=en_us
"set virtualedit=all
set encoding=utf-8
set wildmode=longest,list,full  " enable autocompletion


" Keymaps
let mapleader = " "
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>lv :source $MYVIMRC<CR>
nnoremap j gj
nnoremap k gk
nnoremap L $
nnoremap H ^
nnoremap <C-i> <C-i>zz
nnoremap <C-o> <C-o>zz
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zz
nnoremap # #zz
nnoremap <C-a> G$vgg0
nnoremap <leader>thl :set hls!<CR>
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>
nnoremap <C-Up> :resize +3<CR>
nnoremap <C-Down> :resize -1<CR>
nnoremap <C-Left> :vertical resize +3<CR>
nnoremap <C-Right> :vertical resize -1<CR>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>sv <C-w>v
nnoremap <leader>sh <C-w>s
nnoremap <leader>s= <C-w>=
nnoremap <leader>sx :close<CR>
inoremap jk <Esc>
inoremap kj <Esc>
inoremap <Esc> <Nop>


" Colorscheme
syntax enable
set termguicolors
set background=dark
silent! colorscheme solarized
