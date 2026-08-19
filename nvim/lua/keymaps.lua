-------- Keymaps --------
local map = vim.keymap.set

-- Open netrw
map('n', '<leader>e', ':Ex<CR>', {
    silent = true,
    desc = 'Open file explorer',
})

-- Open Diagnostic list
map('n', '<leader>q', vim.diagnostic.setloclist, {
    silent = true,
    desc = 'Open diagnostic list',
})

-- Window navaigation
map('n', '<C-j>', '<C-w><C-j>', { silent = true })
map('n', '<C-h>', '<C-w><C-h>', { silent = true })
map('n', '<C-k>', '<C-w><C-k>', { silent = true })
map('n', '<C-l>', '<C-w><C-l>', { silent = true })

-- Clear hl on search
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-------- DAP --------
map('n', '<leader>db', function()
    require('dap').toggle_breakpoint()
end, { desc = 'Toggle breakpoint' })

map('n', '<leader>dc', function()
    require('dap').continue()
end, { desc = 'Continue' })

map('n', '<leader>dn', function()
    require('dap').step_over()
end, { desc = 'Step over' })

map('n', '<leader>di', function()
    require('dap').step_into()
end, { desc = 'Step into' })

map('n', '<leader>do', function()
    require('dap').step_out()
end, { desc = 'Step out' })

map('n', '<leader>du', function() require('dapui').toggle() end)
