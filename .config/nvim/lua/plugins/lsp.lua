return {
  {
    "williamboman/mason.nvim",
    opts = {}
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "clangd",
        "ts_ls",
        "texlab",
        "marksman",
        "pyright",
        "rust_analyzer",
        "tinymist",
        "cssls",
        "html",
        "zls",
      }
    },
  },

  {
    "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets"
      },
      config = function()
        -- Set up nvim-cmp.
        local cmp = require("cmp")
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
          snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
              require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            end,
          },
          window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
          },
          mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          }),
          sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' }, -- For luasnip users.
            { name = 'buffer' },
          })
        })

        -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
        -- Set configuration for specific filetype.
        --[[ cmp.setup.filetype('gitcommit', {
          sources = cmp.config.sources({
            { name = 'git' },
          }, {
            { name = 'buffer' },
          })
       })
       require("cmp_git").setup() ]]-- 

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = 'buffer' }
          }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = 'path' }
          }, {
            { name = 'cmdline' }
          }),
          matching = { disallow_symbol_nonprefix_matching = false }
        })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.lsp.config('lua_ls', {
        capabilities = capabilities
      })
      vim.lsp.enable('lua_ls')

      vim.lsp.config('clangd', {
        capabilities = capabilities
      })
      vim.lsp.enable('clangd')

      vim.lsp.config('ts_ls', {
        capabilities = capabilities
      })
      vim.lsp.enable('ts_ls')

      vim.lsp.config('texlab', {
        capabilities = capabilities
      })
      vim.lsp.enable('texlab')

      vim.lsp.config('marksman', {
        capabilities = capabilities
      })
      vim.lsp.enable('marksman')

      vim.lsp.config('pyright', {
        capabilities = capabilities
      })
      vim.lsp.enable('pyright')

      vim.lsp.config('rust_analyzer', {
        capabilities = capabilities
      })
      vim.lsp.enable('rust_analyzer')

      vim.lsp.config('cssls', {
        capabilities = capabilities
      })
      vim.lsp.enable('cssls')

      vim.lsp.config('html', {
        capabilities = capabilities
      })
      vim.lsp.enable('html')

      vim.lsp.config('zls', {
        capabilities = capabilities
      })
      vim.lsp.enable('zls')

      vim.lsp.config('tinymist', {
        capabilities = capabilities
      })
      vim.lsp.enable('tinymist')

      -- setup keymaps
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {}) -- go to definition
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {}) -- Hover documentation
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {}) -- code action
    end
  },
}
