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
set showmode
set backspace=2
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
Plugin 'https://github.com/terryma/vim-multiple-cursors.git'
Plugin 'https://github.com/vim-scripts/Son-of-Obisidian.git'
Plugin 'https://github.com/adampasz/vimfdb.git'
call vundle#end()
filetype plugin indent on

" << vim-airline >>
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_theme="zenburn"

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
	set guifont=Liberation\ Mono\ for\ Powerline\ 12
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar
	set lines=53
	set columns=150
endif

map! <C-Space> <C-x><C-o>

" find selection
vnoremap * y :execute ":let @/=@\""<CR>n

" munit
function AppendLine(line)
	caddexpr a:line
	100500 " scroll to bottom

	if match(a:line, 'PASSED') == 0
		:highlight GreenLine guibg=LightGreen
		:autocmd BufReadPost quickfix match GreenLine /PASSED$/
	elseif match(a:line, '\d\+:FAILED') != -1
		:highlight RedLine guibg=LightRed
		:autocmd BufReadPost quickfix match RedLine /FAILED$/
	endif
endfunction
python << EOF
import vim
import subprocess
def output_lines_incrementally(cmd):
	vim.command('copen')
	vim.command('redraw')
	vim.command('call setqflist([])')
	p = subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True)
	for line in iter(p.stdout.readline, ''):
		vim.command('call AppendLine("' + line + '")')
		vim.command('redraw')
EOF
:command! -nargs=0 RunTests python output_lines_incrementally('haxelib run munit test')
function SaveAndRunTests()
	if expand("%") != ''
		:w
	endif
	:RunTests
endfunction
map ,t :call SaveAndRunTests()<cr>

set exrc
