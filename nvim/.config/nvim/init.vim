filetype on

" Optional dependencies:
" fzf (with a ~/.fzf folder).   used in fzf.vim
" ag (silversearcher).          used in fzf.vim
" pywal                         used in wal.vim
" tmux                          used in vim-tmux-navigator

let mapleader = ","

"" PLUGS

" vim-plug for plugins
call plug#begin() "install plugins with :PlugInstall

" go
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries' }

" navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'EinfachToll/DidYouMean'

" linting
Plug 'W0rp/ale'
Plug 'ntpeters/vim-better-whitespace'
Plug 'sheerun/vim-polyglot'

" UI
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'dylanaraps/wal.vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" python
Plug 'Vimjas/vim-python-pep8-indent'
" Plug 'fisadev/vim-isort'

" file manipulation (requires fzf)
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" writing
Plug 'junegunn/goyo.vim'

" misc
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'

call plug#end()


"" GENERAL

" color
set background=dark
try
	colorscheme wal
catch
	colorscheme industry
endtry

" UI config
set relativenumber		    "show line numbers
filetype indent on	"load filetype-specific indent files
set wildmenu		"visual complete for command menu

" tabs & spaces
set tabstop=4		"number of visual spaces per TAB
set softtabstop=4	"number of spaces in tab when editing
set shiftwidth=4    "?
set expandtab 		"tabs are spaces

"cursor moves to the next displayed line
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$

" search
set incsearch   "search as characters are entered
set hlsearch    "highlight matches
set smartcase   "ignore case in a search until there is capitalization
set gdefault    "s///g is implied

" folding
set foldenable          "enable folding
set foldlevelstart=10   "open most folds by default
set foldmethod=indent   "fold based on indent levels

" buffers
set hidden              "just hide buffers instead of closing the file

" spell check toggle
set spelllang=en
nnoremap <c-s> :setlocal spell! <ENTER>

au BufNewFile,BufRead *.go
    \ set tabstop=4

" PEP8 settings
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=99 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set wrap

" Automatically remove all trailing whitespace from python files
autocmd BufWritePre *.py  %s/\s\+$//e
autocmd FileType go setlocal shiftwidth=4 tabstop=4


"" REMAPS

"add lines above/below
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

"quicker save/quit
nmap <Leader>w :w<CR>
nmap <Leader>x :wq<CR>
nmap <Leader>q :q!<CR>

"redo
nnoremap U <C-R>

"global replace
nnoremap <c-r> *N:%s/<C-R>///c<left><left>

"Y yanks to EOL
nnoremap Y y$

"Screw arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"FZF/ag
"search files
nmap <Leader>f :GFiles<CR>
"search git files
nmap <Leader>F :Files<CR>
"use silversearcher (requires ag)
nmap <Leader>a :Ag<CR>
nnoremap <silent> <C-p> :History<CR>

"" PLUG CONFIGS

" lightline config
set laststatus=2        "always display the last status
set noshowmode          "don't put the mode at the bottom (lightline displays it)
try
        let g:lightline = { 'colorscheme': 'wal' }
catch
        let g:lightline = { 'colorscheme': 'industry' }
endtry

" gitgutter configs
let g:gitgutter_reatime = 0
let g:gitgutter_eager = 0

" ALE
let g:ale_echo_msg_format = '[%linter%] %s'
highlight clear ALEWarning
highlight clear ALEError
highlight ALEErrorSign ctermbg=red
highlight ALEWarningSign ctermbg=gray
let b:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black'],
\}
let g:ale_fix_on_save = 1

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

let g:loaded_matchparen=1

"isort
let g:vim_isort_map = '<C-i>'
