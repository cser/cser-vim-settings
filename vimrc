set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on

set number
set tabstop=4
syntax on
set incsearch

set bomb
set encoding=utf-8
set fileencoding=utf-8

set nobackup
set noswapfile

color shine

let NERDTreeIgnore=['\.meta$']

nnoremap <silent> <F2> :Rgrep<cr>
nnoremap <silent> <S-F2> :RgrepAdd<cr>
nnoremap <silent> <F3> :GrepBuffer<cr>

Bundle 'https://github.com/gmarik/vundle.git'
Bundle 'https://github.com/terryma/vim-multiple-cursors.git'
Bundle 'ctrlp.vim'
Bundle 'https://github.com/scrooloose/nerdtree.git'
Bundle 'https://github.com/jistr/vim-nerdtree-tabs.git'
Bundle 'grep.vim'
