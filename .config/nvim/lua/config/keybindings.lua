vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- move between splits
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true }) -- Move left
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true }) -- Move right
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true }) -- Move down
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true }) -- Move up

-- move lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- move between tabs
vim.keymap.set("n", "<A-Right>", ":bnext<CR>", { silent = true }) -- Next buffer
vim.keymap.set("n", "<A-Left>", ":bprevious<CR>", { silent = true }) -- Previous buffer
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { silent = true }) -- Close current buffer

-- open and close tabs
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { silent = true }) -- New tab
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { silent = true }) -- Close tab
vim.keymap.set("n", "<leader>tl", ":tabnext<CR>", { silent = true }) -- Next tab
vim.keymap.set("n", "<leader>th", ":tabprevious<CR>", { silent = true }) -- Previous tab

-- saving
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true }) -- Save file
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true }) -- Quit file
vim.keymap.set("n", "<leader>x", ":x<CR>", { noremap = true }) -- Save and exit
vim.keymap.set("n", "<leader>Q", ":qa!<CR>", { noremap = true }) -- Force quit all

-- terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true }) -- Exit terminal mode
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { silent = true }) -- Move left
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { silent = true }) -- Move right
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { silent = true }) -- Move down
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { silent = true }) -- Move up
vim.keymap.set("t", "<A-Right>", "<C-\\><A-Right>", { silent = true }) -- Next Buffer
vim.keymap.set("t", "<A-Left>", "<C-\\><A-Left>", { silent = true }) --  up

-- clipboard
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true }) -- Yank to system clipboard
vim.keymap.set("n", "<leader>p", '"+p', { noremap = true }) -- Paste from system clipboard
vim.keymap.set("n", "<leader>d", "yyp", { noremap = true }) -- Duplicate current line
vim.keymap.set("n", "<leader>D", '"_D', { noremap = true }) -- Delete line without affecting clipboard

-- others
vim.keymap.set("n", "<leader>d", "yyp", { noremap = true }) -- Duplicate current line
vim.keymap.set("n", "<leader>s", ":noh<CR>", { noremap = true, silent = true }) -- Clear search
