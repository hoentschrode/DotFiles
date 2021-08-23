call plug#begin('~/.vim/plugged')
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-vinegar.git'
Plug 'qpkorr/vim-bufkill'
Plug 'puremourning/vimspector'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

filetype on
set cursorline
set t_Co=256
colorscheme onehalflight
syntax on
set hidden

let g:coc_config_home='~/.vim'
set incsearch
set hlsearch
" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitright         " New windows to the right
set splitbelow         " New windows below

" Airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=0
let g:airline_theme='onehalfdark'

" Coc-nvim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
highlight CocInfoSign ctermfg=6 guifg=#966a03      " Change Info color

" VimSpector
let g:vimspector_enable_mappings = 'HUMAN'

tnoremap <Esc> <C-\><C-n>                          " Make ESC work in neovim terminal
tnoremap <C-h> <C-\><C-N><C-w>h			   " Make hjkl move as normal
tnoremap <C-j> <C-\><C-N><C-W>j
tnoremap <C-k> <C-\><C-N><C-W>k
tnoremap <C-l> <C-\><C-N><C-W>l
