local bind = vim.keymap.set

-- bind("n", "<leader>ff", function ()
--     vim.lsp.buf.format({ async = true})
-- end, {desc = 'Format File'})

-- bind("n", "<leader>e", ":Ex<CR>", {desc = "Explore"})
bind("n", "<leader>xx", ":source $MYVIMRC<CR>", {desc = "Reload INIT"})

bind("i", "<C-e>", "<C-o>$", {desc = "EOL"})
bind("i", "<C-a>", "<C-o>0", {desc = "EOL"})
-- bind("n", "<leader>e", ":Ex<CR>", {desc = "Explore"})
