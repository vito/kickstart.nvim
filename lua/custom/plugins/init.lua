-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'tpope/vim-abolish', -- :%Subvert etc.
  'tpope/vim-obsession', -- Session.vim
  'tpope/vim-eunuch', -- :Rename etc.
  'tpope/vim-unimpaired', -- [q ]q etc.
  {
    -- existential crisis, but FASTER
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
      }
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'AndreM222/copilot-lualine',
    },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = false,
        },
        sections = {
          lualine_b = { 'diff', 'diagnostics' },
          lualine_c = {
            {
              'filename',
              path = 1, -- relative path
            },
          },
          lualine_x = {
            {
              'copilot',
              -- Default values
              symbols = {
                status = {
                  icons = {
                    enabled = 'AI:E',
                    sleep = 'AI:S', -- auto-trigger disabled
                    disabled = 'AI:D',
                    warning = 'AI:W',
                    unknown = 'AI:?',
                  },
                },
                spinners = require('copilot-lualine.spinners').dots,
              },
              show_loading = true,
            },
            'encoding',
            'fileformat',
            'filetype',
          },
        },
        inactive_sections = {
          lualine_c = {
            {
              'filename',
              path = 1, -- relative path
            },
          },
        },
      }
    end,
  },
  {
    -- close background buffers
    'kazhala/close-buffers.nvim',
    config = function()
      vim.keymap.set('n', '<leader>x', ':BDelete hidden<CR>')
    end,
  },
  'Olical/vim-enmasse', -- best find and replace
  {
    -- db connections
    'tpope/vim-dadbod',
    config = function()
      -- Don't execute queries on save, that's madness.
      vim.g.db_ui_execute_on_save = 0
    end,
  },
  'kristijanhusak/vim-dadbod-ui', -- db query ui
  'tpope/vim-vinegar', -- press - to go to parent dir
  {
    -- floating term
    'numToStr/FTerm.nvim',
    config = function()
      require('FTerm').setup {
        cmd = 'fish',
        border = 'rounded',
        dimensions = {
          height = 0.9,
          width = 0.9,
          x = 0.5,
          y = 0.5,
        },
      }

      vim.keymap.set('n', '<C-t>', '<CMD>lua require("FTerm").toggle()<CR>')
      vim.keymap.set('t', '<C-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
    end,
  },
  {
    -- run tests
    'vim-test/vim-test',
    config = function()
      vim.g['test#strategy'] = 'floaterm'

      vim.keymap.set('n', '<leader>tn', ':TestNearest<CR>', { desc = 'Run Nearest Test' })
      vim.keymap.set('n', '<leader>tf', ':TestFile<CR>', { desc = 'Run File Test' })
      vim.keymap.set('n', '<leader>ts', ':TestSuite<CR>', { desc = 'Run Suite Test' })
      vim.keymap.set('n', '<leader>tl', ':TestLast<CR>', { desc = 'Run Last Test' })
      vim.keymap.set('n', '<leader>tg', ':TestVisit<CR>', { desc = 'Go to Test' })
    end,
  },
  {
    'debugloop/telescope-undo.nvim',
    dependencies = { -- note how they're inverted to above example
      {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
      },
    },
    keys = {
      { -- lazy style key map
        '<leader>u',
        '<cmd>Telescope undo<cr>',
        desc = '[U]ndo history',
      },
    },
    opts = {
      -- don't use `defaults = { }` here, do this in the main telescope spec
      extensions = {
        undo = {
          -- telescope-undo.nvim config, see below
        },
        -- no other extensions here, they can have their own spec too
      },
    },
    config = function(_, opts)
      -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
      -- configs for us. We won't use data, as everything is in it's own namespace (telescope
      -- defaults, as well as each extension).
      require('telescope').setup(opts)
      require('telescope').load_extension 'undo'
    end,
  },
  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('go').setup {
        lsp_codelens = false,
        lsp_keymaps = false,
        lsp_inlay_hints = {
          enable = false,
        },
      }
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  'pbrisbin/vim-mkdir', -- auto-mkdir parent dirs for new file
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  'APZelos/blamer.nvim',
}
