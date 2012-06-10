
" Modeline {{
"	 vi: foldmarker={{,}} foldmethod=marker foldlevel=0: tabstop=4:
" }}

" General {{
	set nocompatible						" Don't be compatible with old Vim

	call pathogen#infect()					" Pathogen requirements

	filetype plugin indent on				" Enable file type specific stuff

	set undofile							" Use a file for undo
	set undodir=~/.vim/undo/				" Save undo in the .vim folder
	set undolevels=2048						" Number of undoes to save

	set completeopt=longest,menu			" Insert most common completion and show menu.

	set ttyfast								" Smoother scrolling

	set encoding=utf-8						" Use Unicode inside Vim's registers, viminfo, buffers ...

	set spelllang=en,sv
	set spell

	if !has('gui_running')
		if !has('win32') && !has('win64')
			set term=$TERM                  " Make arrow and other keys work.
		endif
		if &l:term  =~ "screen.*"
			set ttymouse=xterm2             " Needed for mouse support inside GNU Screen.
		endif
	endif

	set nrformats=alpha,octal,hex			" What to increment/decrement with ^A and ^X"

	" No sound on errors
	set noerrorbells
	set novisualbell
	set t_vb=
	set tm=500

	set mouse=
	if has("mac")
		set clipboard=unnamed
	endif
" }}

" UI {{

	set foldenable					" Use folding

	set number						" Enable line numbers

	set showcmd						" Show partial command in status line
	set showmode					" Show current mode in the last line.
	set showmatch					" Shortly jump to a matching bracket when found a match.

	syntax enable					" Enable syntax highlighting
	set background=light			" Set background to dark
	color solarized					" for Solarized theme

	set tabpagemax=32				" Set max limit of number of tabs

	set backspace=indent,eol,start	" Make backspace work like expected.

	set wildmenu					" Enable tab-completion menu.
	set wildmode=full				" Full completion.

	set scrolljump=5 				" Lines to scroll when cursor leaves screen.
	set scrolloff=3 				" Minimum lines to keep above and below cursor.

	set cursorline					" Highlight current line.

	let g:Powerline_symbols = 'fancy' " Fancy stuff for powerline plugin

	" Not needed now when powerline is used
	" if has('statusline')
		set laststatus=2									" Always show statusline
	"     set statusline=										" Empty status line
	"     set statusline+=%n									" Buffer number
	"     set statusline+=\ [%{getcwd()}]						" Current working directory
	"     "set statusline+=\ %1*[%<%t]%*						" File name
	"     set statusline+=\ %1*[%<%f]%*						" File name
	"     set statusline+=%1*%w%h%m%r%*						" Display [preview window|modified|help buffer|read only]
	"     set statusline+=\ %1*%{fugitive#statusline()}%*		" Display current git branch
	"     set statusline+=%=									" Everything below is at right side
	"     set statusline+=%1*%y%*								" File type
	"     set statusline+=\ [%-3.(%l/%L]:%c%)\ %p%%			" Display [current_line_number/total_line_numbers]:current_col percentage

	"     " Color for status line
	"     "hi User1 term=bold,reverse cterm=bold,reverse gui=bold,reverse ctermfg=6 ctermbg=7 guifg=#a7dfff guibg=#333333
	" endif

	" Set font according to system
	if has("mac")
		set gfn=Inconsolata:h14
		set shell=/bin/bash
	elseif has("linux")
		set gfn=Monospace\ 12
		set shell=/bin/bash
	endif
" }}

" Searching {{

	set hlsearch					" Highlight search.
	set incsearch					" Incremental search.
	set ignorecase					" Case insensitive search.
	set smartcase					" Smart case search.
	set splitbelow					" Open splits below the current window.

" }}

" Formatting {{
	" Whitespace and indent stuff
	set nowrap
	set smartindent
	set autoindent
	set tabstop=4
	set shiftwidth=4
	set softtabstop=4
	set noexpandtab
	" Show a · if there are any whitespace at end of line
	" set list listchars=tab:\ \ ,trail:·
" }}

" Autocmd {{
	if has("autocmd")
		" reload vimrc when saving it
		autocmd bufwritepost .vimrc source ~/.vimrc

		" Set specific stuff for C-files
		autocmd FileType c,cpp setlocal softtabstop=8 tabstop=8 shiftwidth=8 noexpandtab colorcolumn=80

		" Set some nice text wrap stuff for markdown and text files
		autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} setlocal wrap wrapmargin=2 textwidth=72
		autocmd BufRead,BufNewFile *.txt setlocal wrap wrapmargin=2 textwidth=72

		" Make Vim recognize json as JavaScript files
		autocmd BufNewFile,BufRead *.json set ft=javascript

		" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
		autocmd FileType python setlocal expandtab softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

		" make uses real hard tabs or it will break so make sure it's set
		autocmd FileType make setlocal noexpandtab

		" Specific stuff for LaTeX-files.
		" autocmd FileType tex,plaintex setlocal wrap wrapmargin=2 textwidth=120 spell formatoptions+=l
		autocmd FileType tex setlocal wrap linebreak textwidth=0 wrapmargin=0

		autocmd BufRead,BufNewFile .vimperatorrc set ft=vim

		autocmd BufRead,BufNewFile bash_aliases,bash_ps1,.bash_aliases,.bash_ps1 set ft=sh
	endif
" }}

" Plugins {{
	" NERDTree {{
		let g:NERDTreeMouseMode=3			" Single click opens folders and files.
		let g:NERDTreeQuitOnOpen=1			" Close tree after open.
	" }}
" }}

" Mappings {{
	" Map leader to comma
	let mapleader=","

	" vmap
	vmap <C-j> gj
	vmap <C-k> gk
	vmap <C-4> g$
	vmap <C-6> g^
	vmap <C-0> g^
	nmap <C-j> gj
	nmap <C-k> gk
	nmap <C-4> g$
	nmap <C-6> g^
	nmap <C-0> g^

	" Map F2 to show and hide NerdTree
	map <F2> :NERDTreeToggle<CR>
	"map <leader>e :e! ~/.vim_runtime/vimrc<cr>	" Fast editing of the .vimrc

	" inoremap and imap:
	" Replace left bracket with two and the cursor in between like in Eclipse
	inoremap {<CR>  {<CR>}<Esc>O
	"map <leader>{ i{<CR>}<Esc>O

	" nmap:
	" Map space to colon. Don't place this comment on next line or it will
	" break stuff
	nmap <Space> :
	" Edit vimrc.
	nmap <leader>e :tabe $MYVIMRC<CR>

	" cmap:
	" Inserts the path of the currently edited file into a command
	" Command mode: Ctrl+P
	cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

	" nnoremap:
	" Map <F7> to toogle showing white space
	nnoremap <silent> <F7> :set list! listchars=tab:\ \ ,trail:·<CR>
	" Map <F6> to StripTrailingWhitespaces function (see Functions below).
	nnoremap <silent> <F6> :call <SID>StripTrailingWhitespaces()<CR>
	" Map <Leader>c to toggle highlighting of the cursor line
	nnoremap <Leader>c :set cursorline!<CR>

	nnoremap <silent> <F3> :TlistToggle<CR>
" }}

" Soure local {{
	" Include user's local vim config
	"if filereadable(expand("~/.vimrc.local"))
	"	source ~/.vimrc.local
	"endif
" }}

" Functions {{

function! <SID>StripTrailingWhitespaces()
	" save last search,		and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	"_s Do the business:
	%s/\s\+$//e
	" Clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction

" }}

