-- ==========================
-- KEYMAPS
-- ==========================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>e", function()
    if vim.bo.filetype == "netrw" then
        vim.cmd("bd")
    else
        vim.cmd("Ex")
    end
end, { desc = "[E]xplore" }) -- make :Ex a toggle

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- clear highlight

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "e[X]ecute file" }) -- source filehighlight
vim.keymap.set("n", "<space>x", ":.lua<CR>", { desc = "e[x]exute line" }) -- source line (in lua file)
vim.keymap.set("v", "<space>x", ":.lua<CR>", { desc = "e[x]exute highlight" }) -- source hl_line (in lua file)
