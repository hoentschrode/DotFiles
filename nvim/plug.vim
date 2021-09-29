if has("nvim")
    let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()
Plug 'NLKNguyen/papercolor-theme'
Plug 'tpope/vim-fugitive'

if has("nvim")
    Plug 'hoob3rt/lualine.nvim'
    Plug 'windwp/nvim-autopairs'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif
call plug#end()
