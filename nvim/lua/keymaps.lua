local map = vim.keymap.set

-- open file explorer
-- map('n', '<leader>e', ':Ex<CR>', {desc = 'Open Files'})

-- clear hlsearch
map('n', '<Esc><Esc>', '<cmd>nohlsearch<CR>')

-- show quickfix list
map('n', '<leader>q', vim.diagnostic.setloclist, {desc = 'Diagnostic [Q]uickfix list'})

-- window movement commands
map('n', '<C-h>', '<C-w><C-h>', {desc = 'Move focus to the left window'})
map('n', '<C-l>', '<C-w><C-l>', {desc = 'Move focus to the right window'})
map('n', '<C-j>', '<C-w><C-j>', {desc = 'Move focus to the lower window'})
map('n', '<C-k>', '<C-w><C-k>', {desc = 'Move focus to the upper window'})

map('n', '<leader>q', vim.diagnostic.setloclist, {desc = 'Open diagnostic Quickfix list'})

