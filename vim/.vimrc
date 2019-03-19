set nocompatible	"be iMproved, required
filetype off		"required

set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
" Reload with :PluginInstall
Plugin 'VundleVim/Vundle.vim'

Plugin 'junegunn/fzf'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/goyo.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'dylanaraps/wal.vim'
Plugin 'benmills/vimux'
Plugin 'tpope/vim-repeat'
Plugin 'W0rp/ale'
Plugin 'maximbaz/lightline-ale'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Vimjas/vim-python-pep8-indent'

call vundle#end()		"required
filetype plugin indent on	"required

" Lightline config
set laststatus=2
set noshowmode
let g:lightline = { 'colorscheme': 'wal' }

" Colors
syntax enable
set background=dark
set t_Co=16			" make sure using 256 bit color
colorscheme wal

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
hi clear LineNr     "changes line number color
" set cursorline		"highlight current line
" hi CursorLine cterm=NONE, ctermbg=NONE ctermfg=NONE
filetype indent on	"load filtype-specific indent files
set laststatus=2
set wildmenu		"visual complete for command menu
set title
set showmatch

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

" Git
let g:gitgutter_reatime = 0
let g:gitgutter_eager = 0

" Writing
nnoremap <c-d> :Goyo <ENTER>

" Spell Check
set spelllang=en
nnoremap <c-s> :setlocal spell! <ENTER> 

" Python settings (PEP8)
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set wrap

" Automatically remove all trailing whitespace
autocmd BufWritePre *.py  %s/\s\+$//e

" Prompt for a command to run  (Vimux")
map vp :w<CR>:VimuxPromptCommand<CR>
map vl :w<CR>:VimuxRunLastCommand<CR>
map vq :VimuxCloseRunner<CR>
map vt :VimuxRunCommand('make test')<CR>
let g:VimuxUseNearest = 1

" ALE
let g:ale_echo_msg_format = '[%linter%] %s'
highlight clear ALEWarning
highlight clear ALEError
highlight ALEErrorSign ctermbg=red
highlight ALEWarningSign ctermbg=gray

" ALE / Lightline
let g:lightline = {}
let g:lightline.component_expand = {
    \ 'linter_checking': 'lightline#ale#checking',
    \ 'linter_warnings': 'lightline#ale#warnings',
    \ 'linter_errors': 'lightline#ale#errors',
    \ 'linter_ok': 'lightline#ale#ok',
    \ }
let g:lightline.component_type = {
    \ 'linter_checking': 'left',
    \ 'linter_warnings': 'warning',
    \ 'linter_errors': 'error',
    \ 'linter_ok': 'left',
    \ }
let g:lightline.active = {
    \ 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
    \            [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'fileformat', 'fileencoding', 'filetype'] ] }
let g:lightline#ale#indicator_checking = "\uf110 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "

