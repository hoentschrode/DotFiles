set foldmethod=indent
set foldlevel=99

" Folding using space
nnoremap <space> za

" PEP8 indentiation
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
" set textwidth=79
setlocal expandtab
setlocal autoindent
setlocal fileformat=unix
setlocal encoding=utf-8
setlocal nu

let python_highlight_all=1
set cmdheight=2
set updatetime=300
set shortmess+=c

" Goto code navidation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
