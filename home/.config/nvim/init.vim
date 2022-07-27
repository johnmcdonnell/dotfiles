

" Call plugins
call plug#begin('~/.config/nvim/plugged')

"Define your plugins here
Plug 'tpope/vim-surround'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'github/copilot.vim'
Plug 'rktjmp/lush.nvim' " Required for zenbones
Plug 'mcchrish/zenbones.nvim'

call plug#end()

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = "\u33c7"

" Persistent undo
set undofile
set undodir=~/.config/nvim/undo

" Colorscheme
set termguicolors
set background=dark " or light

colorscheme zenbones
