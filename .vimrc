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
if ! filereadable(expand('~/.vim/autoload/plug.vim'))
  echo 'Downloading junegunn/vim-plug to manage plugins...'
  silent !mkdir -p ~/.vim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.vim/autoload/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'preservim/vim-markdown'
call plug#end()


" Options
set nocompatible
set ttyfast
set number relativenumber
set numberwidth=6
set noruler
set showmode
set showcmd
set title
set shortmess=atI
set splitbelow splitright
set autoindent expandtab tabstop=2 shiftwidth=2
set noswapfile
set timeoutlen=1000
set hlsearch
set incsearch
set ignorecase
set nostartofline
set wrap
set textwidth=79
set formatoptions=tcq
set scrolloff=10
set virtualedit=all
set nojoinspaces
set wildmode=longest,list,full  " enable autocompletion
set wildmenu
set history=1000
set noerrorbells
set mouse=a
set clipboard=unnamed
set encoding=utf-8
set spellfile=~/.vim/spell/en.utf-8.add


" Keymaps
let mapleader = ' '
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
nnoremap <leader>ff :Files!<CR>
inoremap jk <Esc>
inoremap kj <Esc>
inoremap <Esc> <Nop>
vnoremap L $h
vnoremap H ^
" edit and reload vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>rv :source $MYVIMRC<CR>


" Colorscheme
syntax enable
set termguicolors
set background=dark
silent! colorscheme solarized


" Autocommands
filetype on
" check spelling in markdown files
autocmd FileType markdown setlocal spell spelllang=en_us
" treat .md files as markdown
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown

