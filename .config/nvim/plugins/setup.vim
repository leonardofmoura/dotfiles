" ------------ Declare Plugins -------------------------------------------

call plug#begin(stdpath('data').'/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'} " code completion engine
Plug 'preservim/nerdcommenter'                  " easy to comment blocks of code
Plug 'scrooloose/nerdtree'                      " file tree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  " better colors for nerdtree
Plug 'ryanoasis/vim-devicons'                   " add icons to some plugins
Plug 'jiangmiao/auto-pairs'                     " automaticaly pair parentheses and other
Plug 'machakann/vim-sandwich'                   " sandwich things with parentheses
Plug 'sheerun/vim-polyglot'                     " improved syntax highlihting 
Plug 'akinsho/bufferline.nvim'                  " show buffers as tabs 

Plug 'dracula/vim'                              " dracula theme
Plug 'joshdick/onedark.vim'                     " one dark theme

call plug#end()

" ------------- Plugin Initialization --------------------------------------
source ~/.config/nvim/plugins/bufferline.vim    " init bufferline
source ~/.config/nvim/plugins/coc.vim           " init coc
