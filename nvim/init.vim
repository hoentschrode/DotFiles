" Basic neovim configuration
"

" init autocmd
autocmd!
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

set nocompatible
set number
syntax enable
set encoding=UTF-8
set title
set autoindent
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Don't redraw while executing mactos (good performance config)
set lazyredraw
" Ignore case when searching
set ignorecase
set smarttab
filetype plugin indent on
set shiftwidth=4
set tabstop=4
set ai
set si
set nowrap
set backspace=start,eol,indent

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Add asterisks in block comments
set formatoptions+=r

" *** Highlights ***
set cursorline
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver25-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
" Set cursor line on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40
highlight LineNr cterm=NONE ctermfg=240 guifg=#2b506e guibg=#000000
augroup BgHighlight
	autocmd!
	autocmd WinEnter * set cul
	autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
	autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
	autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

" *** Filetypes ***
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.py set filetype=python

set suffixesadd=.js,.json,.py,.md

autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" *** Imports ***
runtime ./plug.vim
if has("unix")
	let s:uname = system("uname -s")
	" Do MacOs stuff
	if s:uname == "Darwin\n"
		runtime ./macos.vim
	endif
endif

runtime ./maps.vim

" *** Syntax theme ***
if exists("&termguicolors") && exists("&winblend")
	syntax enable
	set termguicolors
	set winblend=0
	set wildoptions=pum
	set pumblend=5
	" ...colorscheme
    colorscheme onehalflight
endif

" *** Extras
set exrc
" vim: set foldmethod=marker foldlevel=0:
