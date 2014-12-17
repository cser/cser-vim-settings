set nocompatible

set t_Co=256
set number
set tabstop=4
set shiftwidth=4
set incsearch
set hlsearch
set nobackup
set noswapfile
set smartindent

" buffers settings
set hidden
set autowrite
nmap <C-h> :bprevious<CR>
nmap <C-l> :bnext<CR>
nmap <C-w>x :bp <BAR> bd #<CR>

" << Vundle >>
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'https://github.com/bling/vim-airline.git'
Plugin 'https://github.com/morhetz/gruvbox.git'
Plugin 'https://github.com/altercation/vim-colors-solarized.git'
Plugin 'https://github.com/noah/vim256-color.git'
Plugin 'https://github.com/xolox/vim-colorscheme-switcher.git'
Plugin 'https://github.com/xolox/vim-misc.git'
Plugin 'https://github.com/jdonaldson/vaxe.git'
Plugin 'https://github.com/eiginn/netrw.git'
Plugin 'https://github.com/Valloric/YouCompleteMe.git'
Plugin 'https://github.com/xolox/vim-session.git'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/jlanzarotta/bufexplorer.git'
Plugin 'https://github.com/Lokaltog/vim-easymotion.git'
call vundle#end()
filetype plugin indent on

" << vim-airline >>
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

" << vim-colorscheme-switcher >>
map ,cn :NextColorScheme<cr>
map ,cp :PrevColorScheme<cr>

" << netrw >>
let g:netrw_alltv=1
let g:netrw_fastbrowse=2
let g:netrw_keepdir=0
let g:netrw_liststyle=2
let g:netrw_retmap=1
let g:netrw_silent=1
let g:netrw_special_syntax=1

" << vim-session >>
map ,ss :SaveSession<space>
map ,so :OpenSession<space>
map ,sr :RestartVim<cr>
let session_autosave=0
let session_autoload=0
let g:session_persist_colors=1
let g:session_menu=1

" << bufexplorer >>
nmap ,b \be

" << vim-easymotion >>
map <Space> <Plug>(easymotion-s)

" << nerdtree >>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.\.$', '\.$', '\~$']

" << vaxe >>
let g:vaxe_lime_target="html5"
map ,m :w<cr>:make<cr>:copen<cr><cr><C-w>k

syntax on
let g:solarized_termcolors=256
"color lucius
color mac_classic
if has("gui_running")
	"set guifont="Liberation Mono for Powerline 12"
	color gruvbox
else
	let g:airline_theme="zenburn"
endif

map! <C-Space> <C-x><C-o>

" find selection
vnoremap * y :execute ":let @/=@\""<CR>n

set exrc
