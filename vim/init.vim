" vi: foldmethod=marker:

" Plugins {{{

" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')

" UI
Plug 'joshdick/onedark.vim'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons' " vimscript

" Git related
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-git'
Plug 'airblade/vim-gitgutter'

" Navigation related, searching, opening files, etc
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'

" Language specific
Plug 'vim-scripts/indentpython.vim'
Plug 'davidhalter/jedi-vim'
Plug 'msanders/snipmate.vim'
Plug 'sheerun/vim-polyglot'
Plug 'alfredodeza/coveragepy.vim'
Plug 'dense-analysis/ale'
Plug 'WolfgangMehner/c-support'

" Misc
Plug 'editorconfig/editorconfig-vim'
Plug 'ddollar/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'sjl/gundo.vim'
Plug 'mtth/scratch.vim'

call plug#end()

" }}}

lua require("plugins.galaxyline")

" General {{{

" Enable file type specific stuff
filetype plugin indent on

let $_undo_path = stdpath('data') . '/undo'
set undofile
set undodir=$_undo_path
set undolevels=2048

set fileencoding=utf8

set spelllang=en,sv
set spell

set hidden

" What to increment/decrement with ^A and ^X"
set nrformats=alpha,octal,bin,hex

set wildignore+=*.pyc

set clipboard=unnamedplus

set splitbelow

set ignorecase
set smartcase

set nowrap
set smartindent
" }}}

" UI {{{

" No sound on errors
set noerrorbells
set novisualbell

set mouse=
set number
set showmatch

set termguicolors
color onedark

" Minimum lines to keep above and below cursor.
set scrolloff=3

set cursorline

" }}}

" Autocmd {{{

" reload init.vim when saving it
autocmd bufwritepost $MYVIMRC source $MYVIMRC

" Make Vim recognize PDL2 files.
autocmd BufRead,BufNewFile *.pdl set ft=pdl2
autocmd BufRead,BufNewFile *.lsv set ft=lsv

" Force .h files to be recognized as C instead of C++
autocmd BufRead,BufNewFile *.h setlocal ft=c

" }}}

" Mapping {{{

let mapleader=","


map <F2> :NERDTreeToggle<CR>

" "smart" brackets
inoremap {<CR>  {<CR>}<Esc>O

" The best setting
nmap <Space> :

nmap <leader>e :tabe $MYVIMRC<CR>

" <leader>w to toogle showing white space
nmap <silent> <leader>w :set list! listchars=tab:»·,eol:$,trail:·<CR>

" Ctrl+/ clears search highlight
nmap <silent> <C-_> :nohlsearch<CR>

nnoremap <leader>g :GundoToggle<CR>

" <leader>c toggles highlighting of the cursor line
nnoremap <leader>c :set cursorline!<CR>

" <leader>t strips trailing whitespace on all lines
nnoremap <leader>t :%s/\s\+$//g<CR>

" This rewires n and N to a highlighing function
nnoremap <silent> n   n:call HLNext(0.1)<cr>
nnoremap <silent> N   N:call HLNext(0.1)<cr>

" <leader>s to replace current word under cursor
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

" fzf mappings
nnoremap <leader>f :FZF<space>
nnoremap <c-p> :Files<CR>
nnoremap <leader>T :Tags<CR>
nnoremap ; :Buffers<CR>

" Turn off arrow keys.
map <up> <nop>
map <down> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Remap left and right arrow to change tabs
map <left> gT
map <right> gt

" git-gutter mappings
nmap <leader>hj <Plug>(GitGutterNextHunk)
nmap <leader>hk <Plug>(GitGutterPrevHunk)

" }}}

" Plugin configs {{{

" Tagbar {{{
nmap <silent> <leader>b :TagbarOpenAutoClose<CR>
" }}}

" fugitive-gitlab {{{
let g:fugitive_gitlab_domains = ['https://gitlab.cognibotics.net/']
" }}}

" jedi-vim {{{
" let g:jedi#popup_on_dot = 0
let g:jedi#goto_stubs_command = '<leader>js'
" }}}

" neovim {{{
let g:python_host_prog = '/Users/erik/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/erik/.pyenv/versions/neovim3/bin/python'
" }}}

let g:scratch_autohide = 1

" vim-polyglot {{{
let g:csv_no_conceal = 1
let g:csv_nomap_space = 1
" }}}

" }}}

" Functions {{{

" Highlight a search match in red
function! HLNext (blinktime)
	let [bufnum, lnum, col, off] = getpos('.')
	let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
	let target_pat = '\c\%#'.@/
	let ring = matchadd('IncSearch', target_pat, 101)
	redraw
	exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
	call matchdelete(ring)
	redraw
endfunction

" }}}

let local_init = stdpath('config') . "/init.vim.local"
if filereadable(local_init)
	source local_init
endif

set exrc
set secure
