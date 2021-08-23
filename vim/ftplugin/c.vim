set foldmethod=indent
set foldlevel=99

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
set textwidth=79
setlocal expandtab
setlocal autoindent
setlocal fileformat=unix
setlocal encoding=utf-8
setlocal nu

set cmdheight=2

" Goto code navidation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
