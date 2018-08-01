set nocompatible	"be iMproved, required
filetype off		"required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'junegunn/fzf'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'godlygeek/csapprox'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-obsession'

call vundle#end()		"required
filetype plugin indent on	"required

" Colors
syntax enable
set background=dark
set t_Co=256			" make sure using 256 bit color
colorscheme 0x7A69_dark

" Spaces & Tabs
set tabstop=4		"number of visual spaces per TAB
set softtabstop=4	"number of spaces in tab when editing
set expandtab 		"tabs are spaces
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$

" UI Config
set number		    "show line numbers
set cursorline		"highlight current line
filetype indent on	"load filtype-specific indent files
set wildmenu		"vidual complete for command menu

" Searching
set incsearch   "search as characters are entered
set hlsearch    "highlight matches

" Folding
set foldenable          "enable folding
set foldlevelstart=10   "open most folds by default
set foldmethod=indent   "fold based on indent levels
nnoremap <space> za     "space open/closes fold


" Buffers
set hidden