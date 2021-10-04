" -------------- Configurations -------------------------------------
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
" set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
" set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

" ------------ Plugins ------------------------------------------------

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
Plug 'joshdick/onedark.vim'                    " one dark theme

call plug#end()

" -------- Color Schemes ----------------------------------------------
"colorscheme dracula
"set termguicolors
"colorscheme onedark
colorscheme default

" ------- Init Buffernline ------------------------------------------
lua << EOF
require("bufferline").setup{}
EOF

" --------------------------------------------------------------------
