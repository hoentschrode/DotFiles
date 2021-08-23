if has("nvim")
    let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()
Plug 'sonph/onehalf', { 'rtp': 'vim/' }
Plug 'tpope/vim-fugitive'

if has("nvim")
    Plug 'hoob3rt/lualine.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'windwp/nvim-autopairs'
    Plug 'kyazdani42/nvim-web-devicons'
endif
call plug#end()
