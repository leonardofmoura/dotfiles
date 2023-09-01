nnoremap <C-b> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

highlight NvimTreeFolderIcon guibg=blue

lua <<EOF
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  -- auto_close          = true,
  open_on_tab         = false,
  hijack_cursor       = true,
  update_cwd          = true,
  hijack_directories  = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    hide_root_folder = false,
    side = 'left',
    number = false,
    relativenumber = false
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
  renderer = {
    highlight_opened_files = "all",
    highlight_git = true,
    indent_markers = {
      enable = true,
    },
    special_files = {
      "README.md", 
      "Makefile", 
      "MAKEFILE", 
    }
  },
}
EOF

:NvimTreeToggle
