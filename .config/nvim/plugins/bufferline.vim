" ------- Init Buffernline ------------------------------------------
lua << EOF
require("bufferline").setup{}
EOF

" --------- Key Shortcuts -------------------------------------------
nnoremap <silent> <A-Right> :BufferLineCycleNext<CR>
nnoremap <silent> <A-Left> :BufferLineCyclePrev<CR>
