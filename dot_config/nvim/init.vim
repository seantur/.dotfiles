" Make sure vim-plug is installed:
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

" Optional dependencies:
" fzf (with a ~/.fzf folder).   used in fzf.vim
" rg                            used in fzf.vim
" tmux                          used in vim-tmux-navigator
" fd                            used in telescope.nvim (sharkdp/fd)

filetype on

let mapleader = ","


"" PLUGS

" vim-plug for plugins
call plug#begin() "install plugins with :PlugInstall

" navigation
Plug 'christoomey/vim-tmux-navigator'  "Allows for seamless navigation between vim and tmux splits
Plug 'EinfachToll/DidYouMean'  "Asks for the right file to open

" linting
Plug 'dense-analysis/ale'  "Provides asynchronous linting
Plug 'ntpeters/vim-better-whitespace'  "Highlights all trailing whitespace
Plug 'sheerun/vim-polyglot'  "A collection of language packs

" UI
Plug 'vim-airline/vim-airline'  "Lean % Mean status / tabline
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'  "Nord theme

" git
Plug 'tpope/vim-fugitive'  "premier Vim plugin for Git
Plug 'airblade/vim-gitgutter'  "shows a git diff in the sign column

" writing
Plug 'junegunn/goyo.vim'  "Distraction free writing
Plug 'lervag/vimtex'  " filetype and syntax plugin for LaTeX files

" telescope
Plug 'nvim-lua/plenary.nvim'  "lua function - required for telescope
Plug 'nvim-telescope/telescope.nvim'  "highly extendable fuzzy finder over lists
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

call plug#end()


"" GENERAL CONFIG

" color
try
	colorscheme nord
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

" remove paren highlighting
let g:loaded_matchparen=1

" turn on spell check for markdown files
autocmd FileType latex,tex,markdown,md setlocal spell


"" REMAPS

" add lines above/below
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" quicker save/quit
nmap <Leader>x :wq<CR>

" redo
nnoremap U <C-R>

" global replace
nnoremap <c-r> *N:%s/<C-R>///c<left><left>

" Y yanks to EOL
nnoremap Y y$

" Screw arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>


"" PLUG CONFIGS

" airline
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
let g:airline_extensions = ['ale', 'tabline']

" ale
let g:ale_linters = {
    \ 'python': ['ruff'],
    \}

let g:ale_fixers = {
    \ 'python': ['ruff_format'],
    \}

let g:ale_fix_on_save = 1

" vim better whitspace
let g:python_highlight_all = 1
let g:strip_whitespace_on_save = 1
let g:better_whitespace_enabled = 1

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" VimTex
filetype plugin indent on
syntax  enable
