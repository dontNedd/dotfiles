vim.g.mapleader = " "

local set = vim.keymap.set
set("n", "<leader>e", vim.cmd.Ex, { desc = "netrw" })

-- clear hl
set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- normal move window ez
set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Terminal mode window navigation
set('t', '<C-h>', [[<C-\><C-n><C-w><C-h>]], { desc = 'Move focus to the left window' })
set('t', '<C-l>', [[<C-\><C-n><C-w><C-l>]], { desc = 'Move focus to the right window' })
set('t', '<C-j>', [[<C-\><C-n><C-w><C-j>]], { desc = 'Move focus to the lower window' })
set('t', '<C-k>', [[<C-\><C-n><C-w><C-k>]], { desc = 'Move focus to the upper window' })

-- Keep cursor in place while moving up/down page
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")

-- center screen when looping search results
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- sometimes in insert mode, control-c doesn't exactly work like escape
set("i", "<C-c>", "<Esc>")

-- add binds for Control J/K to scroll thru quickfix list
-- global (all open window/buffer)
-- NOTE: might confilct with moving windows
set("n", "<C-j>", "<cmd>cnext<CR>zz")
set("n", "<C-k>", "<cmd>cprev<CR>zz")
-- local
set("n", "<leader>k", "<cmd>lnext<CR>zz")
set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- see undotree
set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- disable Ex mode
set("n", "Q", "<nop>")


-- insert mode to normal mode
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })
