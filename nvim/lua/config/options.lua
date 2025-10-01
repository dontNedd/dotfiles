-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

vim.schedule(function()
    vim.o.clipboard = "unnamedplus"
end)

vim.o.autoindent = false
vim.o.smartindent = false
vim.o.cindent = false
vim.o.breakindent = true
vim.o.expandtab = false

vim.o.showmode = false
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true
