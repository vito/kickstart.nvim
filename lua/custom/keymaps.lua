-- escape with smashing j and k; easier to press quickly on slow systems
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Escape with jk', noremap = true, silent = true })
vim.keymap.set('i', 'kj', '<Esc>', { desc = 'Escape with kj', noremap = true, silent = true })

-- move by visual line, not actual line (i.e. wrapping)
vim.keymap.set('n', 'j', 'gj', { desc = 'Move down visual line', noremap = true, silent = true })
vim.keymap.set('n', 'k', 'gk', { desc = 'Move up visual line', noremap = true, silent = true })

-- save on enter
vim.keymap.set('n', '<CR>', function()
  if vim.api.nvim_buf_get_option(0, 'buftype') == 'quickfix' then
    return '<CR>'
  else
    return ':w<CR>'
  end
end, { noremap = true, expr = true, silent = true })
