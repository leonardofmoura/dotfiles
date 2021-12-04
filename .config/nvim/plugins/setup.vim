" ------------ Declare Plugins -------------------------------------------

call plug#begin(stdpath('data').'/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}                 " code completion engine
Plug 'preservim/nerdcommenter'                                  " easy to comment blocks of code
Plug 'jiangmiao/auto-pairs'                                     " automaticaly pair parentheses and other
Plug 'machakann/vim-sandwich'                                   " sandwich things with parentheses
Plug 'akinsho/bufferline.nvim'                                  " show buffers as tabs 
Plug 'vim-airline/vim-airline'                                  " improved line at the bottom
Plug 'tpope/vim-fugitive'                                       " git integration
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}     " syntax highlight and more
Plug 'kyazdani42/nvim-web-devicons'                             " for file icons
Plug 'kyazdani42/nvim-tree.lua'                                 " side tree


Plug 'dracula/vim'                                              " dracula theme
Plug 'joshdick/onedark.vim'                                     " one dark theme

call plug#end()

" ------------- Plugin Initialization --------------------------------------
source ~/.config/nvim/plugins/bufferline.vim                    " init bufferline
source ~/.config/nvim/plugins/coc.vim                           " init coc
source ~/.config/nvim/plugins/treesitter.vim                    " load treesitter
source ~/.config/nvim/plugins/nvim-tree.vim                     " load nvim-tree
