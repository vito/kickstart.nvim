-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- color schemes
  'savq/melange-nvim',
  'AlexvZyl/nordic.nvim',
  'rebelot/kanagawa.nvim',
  'pineapplegiant/spaceduck',
  'oahlen/iceberg.nvim',
  'EdenEast/nightfox.nvim',
  {
    'zenbones-theme/zenbones.nvim',
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = 'rktjmp/lush.nvim',
  },
  {
    'sainnhe/everforest',
    -- lazy = false,
    -- priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.everforest_enable_italic = true
      vim.g.everforest_background = 'hard'
      -- vim.cmd.colorscheme 'everforest'
    end,
  },

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
    'jiaoshijie/undotree',
    dependencies = 'nvim-lua/plenary.nvim',
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { '<leader>u', "<cmd>lua require('undotree').toggle()<cr>" },
    },
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
