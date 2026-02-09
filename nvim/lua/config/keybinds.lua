vim.g.mapleader = " "
local set = vim.keymap.set
set("n", "<leader>e", vim.cmd.Ex, { desc = "N[e]trw" })

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

-- see undotree
set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "[U]ndotree" })

-- reload config
function _G.reload_config()
    local reload = require("plenary.reload").reload_module
    reload("me", false)

    dofile(vim.env.MYVIMRC)
    vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

set("n", "rr", _G.reload_config, { desc = "[R]eload configuration without restart nvim" })


-- insert mode to normal mode
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })

-- Diagnostic keymaps
set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostic [Q]uickfix list" })
