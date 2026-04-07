

" Call plugins
set nocompatible
call plug#begin('~/.config/nvim/plugged')

"Define your plugins here
Plug 'tpope/vim-surround'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-fugitive'
Plug 'github/copilot.vim'
Plug 'rktjmp/lush.nvim' " Required for zenbones
Plug 'mcchrish/zenbones.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'savq/melange'
Plug 'feline-nvim/feline.nvim'
Plug 'kyazdani42/nvim-web-devicons' " Requires a Nerd Font in your terminal (brew install --cask font-hack-nerd-font)
call plug#end()

" Persistent undo
set undofile
set undodir=~/.config/nvim/undo



" Colorscheme
set termguicolors
set background=dark " or light

colorscheme melange

" Statusline
lua require('feline').setup()

