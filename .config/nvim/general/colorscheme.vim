"colorscheme dracula
"colorscheme default

let g:onedark_hide_endofbuffer = 1 " hide end of buffer lines
let g:onedark_terminal_italics = 1 " support italics

let g:onedark_color_overrides = {
    \ "red": { "gui": "#D36A75", "cterm": "204", "cterm16": "1" },
    \ "green": { "gui": "#98c379", "cterm": "114", "cterm16": "2" },
    \ "yellow": { "gui": "#EBC67C", "cterm": "180", "cterm16": "3" },
    \ "blue": { "gui": "#61afef", "cterm": "39", "cterm16": "4" },
    \ "purple": { "gui": "#c678dd", "cterm": "170", "cterm16": "5" },
    \ "cyan": { "gui": "#549FAA", "cterm": "38", "cterm16": "6" },
    \ "white": { "gui": "#C0C5Ce", "cterm": "145", "cterm16": "15" },
    \ "black": { "gui": "#2B303B", "cterm": "235", "cterm16": "0" },
    \ "background": { "gui": "#1e222a", "cterm": "235", "cterm16": "NONE" },
    "\ "foreground": {"gui": "#98ccb7", "cterm": "145", "cterm16": "NONE"}
\}

set termguicolors
colorscheme onedark
