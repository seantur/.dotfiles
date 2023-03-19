" Make sure vim-plug is installed:
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


filetype on

" Optional dependencies:
" fzf (with a ~/.fzf folder).   used in fzf.vim
" rg                            used in fzf.vim
" tmux                          used in vim-tmux-navigator
" fd                            used in telescope.nvim (sharkdp/fd)

let mapleader = ","

"" PLUGS

" vim-plug for plugins
call plug#begin() "install plugins with :PlugInstall

" navigation
Plug 'christoomey/vim-tmux-navigator'  "Allows for seamless navigation between vim and tmux splits
Plug 'EinfachToll/DidYouMean'  "Asks for the right file to open

" linting
Plug 'W0rp/ale'  "Provides asychronous linting
Plug 'ntpeters/vim-better-whitespace'  "Highlights all trailing whitespace
Plug 'sheerun/vim-polyglot'  "A collection of language packs

" UI
Plug 'itchyny/lightline.vim'  "A light and configurable statusline/tabline
Plug 'arcticicestudio/nord-vim'  "Nord theme

" git
Plug 'tpope/vim-fugitive'  "premier Vim plugin for Git
Plug 'airblade/vim-gitgutter'  "shows a git diff in the sign column

" writing
Plug 'junegunn/goyo.vim'  "Distraction free writing

" telescope
Plug 'nvim-lua/plenary.nvim'  "lua function - required for telescope
Plug 'nvim-telescope/telescope.nvim'  "highly extendable fuzzy finder over lists
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" misc
Plug 'vimwiki/vimwiki'  "personal wiki for vim

call plug#end()


"" GENERAL

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

"" REMAPS

"add lines above/below
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

"quicker save/quit
nmap <Leader>x :wq<CR>

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

"" PLUG CONFIGS

" lightline config
set laststatus=2        "always display the last status
set noshowmode          "don't put the mode at the bottom (lightline displays it)
try
        let g:lightline = { 'colorscheme': 'nord' }
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

" ALE / Lightline
let g:lightline = {}
let g:lightline.active = {
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'fileformat', 'fileencoding', 'filetype'] ] }

let g:loaded_matchparen=1

" vimwiki
set nocompatible
filetype plugin on
syntax on

if filereadable(expand("~/.config/nvim/vimwiki.vim"))
    source ~/.config/nvim/vimwiki.vim
endif

let g:python_highlight_all = 1
let g:strip_whitespace_on_save = 1
let g:better_whitespace_enabled = 1

" Turn on spell check for markdown files
autocmd FileType latex,tex,markdown,md setlocal spell

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
