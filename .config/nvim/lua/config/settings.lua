local opt = vim.opt

opt.number = true           -- Show line numbers
opt.mouse = "a"             -- Enable mouse support in all modes
opt.autoindent = true       -- Maintain the indentation of the previous line
opt.smartindent = true      -- Automatically insert indentation based on syntax rules
opt.signcolumn = "yes"      -- Always show the sign column to avoid text shifting

opt.termguicolors = true    -- Enable true color support in the terminal

opt.expandtab = true        -- Convert tabs to spaces
opt.shiftwidth = 2          -- Number of spaces for each indentation level
opt.tabstop = 2             -- Number of spaces a tab character represents
opt.softtabstop = 2         -- Fine-tunes tab behavior when editing

opt.ignorecase = true       -- Ignore case in search patterns
opt.smartcase = true        -- Override ignorecase if search contains uppercase letters
opt.incsearch = true        -- Show search results as you type
opt.scrolloff = 8           -- Keep at least 8 lines above/below the cursor while scrolling
opt.sidescrolloff = 8       -- Keep at least 8 columns to the left/right of the cursor

opt.splitbelow = true       -- Open new horizontal splits below the current window
opt.splitright = true       -- Open new vertical splits to the right of the current window
opt.equalalways = true      -- Resize split windows equally when adjusting window sizes
opt.smoothscroll = true     -- Enable smooth scrolling (if supported)

opt.wrap = true             -- Enable line wrapping
opt.linebreak = true        -- Wrap lines at word boundaries instead of breaking mid-word
opt.colorcolumn = "80"      -- Highlight the 80th column to guide line length
opt.showbreak = "󱞩 "

opt.undofile = true         -- Enable persistent undo (saves undo history)

opt.clipboard = "unnamedplus"  -- Use system clipboard for copy/paste


-- Set spellcheck on markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt.spell = true  -- Enable spell checking
    vim.opt.spelllang = "en,pt"
  end,
})

