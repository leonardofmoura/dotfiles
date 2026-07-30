return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {
      lsp = {
        code_actions = {
          previewer = "codeaction_native",
          preview_pager = "delta --side-by-side --width=$FZF_PREVIEW_COLUMNS"
        }
      }
    },
    keys = {
      {"<C-P>", "<cmd>FzfLua files<CR>"},
      {"<C-F>", "<cmd>FzfLua<CR>"},
      {"<leader>ca", "<cmd>FzfLua lsp_code_actions<CR>"},
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")
      ts.setup({})

      local ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "diff",
        "dockerfile",
        "doxygen",
        "go",
        "groovy",
        "html",
        "java",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "latex",
        "lua",
        "luadoc",
        "luap",
        "make",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "rust",
        "scss",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      }

      ts.install(ensure_installed)

      -- enable native treessitter features depending on filetype
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {'<filetype>'},
        callback = function()
          vim.treesitter.start() -- enable treesitter highlinghting
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- enable indentation
        end,
      })
    end
  },

  {
    'echasnovski/mini.pairs',
    version = false,
    opts = {
      skip_ts = {"string"}, -- do noy autopair inside string
      skip_unbalanced = true, -- do not autopair when things are messy
      markdown = true -- better deal with markdown
    }
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {}
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },

  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    priority = 49,
  },

  {
    "folke/twilight.nvim",
    opts = {}
  },

  {
    "folke/zen-mode.nvim",
    opts = {
      plugins = {
        options = {
          ruler = true,
          showcmd = true,
        },
        twilight = { enabled = false }
      }
    }
  },

  {
    "preservim/vim-pencil",
  },

  {
    "leonardofmoura/writing-sessions.nvim"
  },

  {
    "bullets-vim/bullets.vim"
  },
}

