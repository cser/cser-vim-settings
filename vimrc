set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on

set number
set tabstop=4
set shiftwidth=4
syntax on
set incsearch
set hlsearch

set encoding=utf-8 bomb
set fileencoding=utf-8 bomb

set nobackup
set noswapfile
set errorformat ^=\ %#%f(%l\\\,%c):\ %m

let g:ctrlp_by_filename = 1

color shine

let NERDTreeIgnore=['\.meta$']

map git :silent !"C:\Program Files (x86)\Git\bin\sh.exe" --login -i<CR>
map make :silent make<CR>:copen<CR>

nnoremap <silent> <F2> :Rgrep<cr>
nnoremap <silent> <S-F2> :RgrepAdd<cr>
nnoremap <silent> <F3> :GrepBuffer<cr>

Bundle 'https://github.com/gmarik/vundle.git'
Bundle 'https://github.com/terryma/vim-multiple-cursors.git'
Bundle 'ctrlp.vim'
Bundle 'https://github.com/scrooloose/nerdtree.git'
Bundle 'https://github.com/jistr/vim-nerdtree-tabs.git'
Bundle 'grep.vim'
Bundle 'matchparenpp'
Bundle 'https://github.com/tpope/vim-fugitive.git'
