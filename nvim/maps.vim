" Mappings

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitright         " New windows to the right
set splitbelow         " New windows below

tnoremap <Esc> <C-\><C-n>                          " Make ESC work in neovim terminal
tnoremap <C-h> <C-\><C-N><C-w>h                    " Make hjkl move as normal
tnoremap <C-j> <C-\><C-N><C-W>j
tnoremap <C-k> <C-\><C-N><C-W>k
tnoremap <C-l> <C-\><C-N><C-W>l
