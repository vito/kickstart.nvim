-- escape with smashing j and k; easier to press quickly on slow systems
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Escape with jk', noremap = true, silent = true })
vim.keymap.set('i', 'kj', '<Esc>', { desc = 'Escape with kj', noremap = true, silent = true })

-- move by visual line, not actual line (i.e. wrapping)
vim.keymap.set('n', 'j', 'gj', { desc = 'Move down visual line', noremap = true, silent = true })
vim.keymap.set('n', 'k', 'gk', { desc = 'Move up visual line', noremap = true, silent = true })

-- save on enter
vim.keymap.set('n', '<CR>', function()
  if vim.bo.buftype == 'quickfix' then
    return '<CR>'
  else
    return ':w<CR>'
  end
end, { noremap = true, expr = true, silent = true })

-- VSCode specific keymaps
if vim.g.vscode then
  -- Go to references
  vim.keymap.set('n', 'gr', '<Cmd>call VSCodeNotify("editor.action.referenceSearch.trigger")<CR>', { silent = true })

  -- Go to definition
  vim.keymap.set('n', 'gd', '<Cmd>call VSCodeNotify("editor.action.revealDefinition")<CR>', { silent = true })

  -- Go to workspace symbol
  vim.keymap.set('n', 'gS', '<Cmd>call VSCodeNotify("workbench.action.showAllSymbols")<CR>', { silent = true })

  -- Rename symbol
  vim.keymap.set('n', '<leader>rn', '<Cmd>call VSCodeNotify("editor.action.rename")<CR>', { silent = true })

  -- Show hover
  vim.keymap.set('n', 'K', '<Cmd>call VSCodeNotify("editor.action.showHover")<CR>', { silent = true })

  -- Format document
  vim.keymap.set('n', '<leader>f', '<Cmd>call VSCodeNotify("editor.action.formatDocument")<CR>', { silent = true })

  -- Quick Fix action
  vim.keymap.set('n', '<leader>ca', '<Cmd>call VSCodeNotify("editor.action.quickFix")<CR>', { silent = true })

  -- Toggle sidebar (file explorer)
  vim.keymap.set('n', '\\', '<Cmd>call VSCodeNotify("workbench.action.toggleSidebarVisibility")<CR>', { silent = true })

  -- Find files
  vim.keymap.set('n', '<C-p>', '<Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>', { silent = true })
  vim.keymap.set('n', '<leader>sf', '<Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>', { silent = true })

  -- Search in workspace
  vim.keymap.set('n', '<leader>sg', '<Cmd>call VSCodeNotify("workbench.action.findInFiles")<CR>', { silent = true })

  -- Terminal: focus and maximize in one command
  vim.keymap.set('n', '<C-t>', '<Cmd>call VSCodeNotify("workbench.action.terminal.focus")<CR>', { silent = true })

  -- Document symbols
  vim.keymap.set('n', '<leader>ds', '<Cmd>call VSCodeNotify("workbench.action.gotoSymbol")<CR>', { silent = true })

  -- Workspace symbols
  vim.keymap.set('n', '<leader>ws', '<Cmd>call VSCodeNotify("workbench.action.showAllSymbols")<CR>', { silent = true })

  -- Test running
  vim.keymap.set('n', '<leader>tn', '<Cmd>call VSCodeNotify("testing.runAtCursor")<CR>', { silent = true })
  vim.keymap.set('n', '<leader>tf', '<Cmd>call VSCodeNotify("testing.runCurrentFile")<CR>', { silent = true })
  vim.keymap.set('n', '<leader>ts', '<Cmd>call VSCodeNotify("testing.runAll")<CR>', { silent = true })
  vim.keymap.set('n', '<leader>tl', '<Cmd>call VSCodeNotify("testing.reRunLastRun")<CR>', { silent = true })
  vim.keymap.set('n', '<leader>tg', '<Cmd>call VSCodeNotify("testing.showMostRecentOutput")<CR>', { silent = true })

  -- Navigate diagnostics
  vim.keymap.set('n', ']d', '<Cmd>call VSCodeNotify("editor.action.marker.next")<CR>', { silent = true })
  vim.keymap.set('n', '[d', '<Cmd>call VSCodeNotify("editor.action.marker.prev")<CR>', { silent = true })
end
