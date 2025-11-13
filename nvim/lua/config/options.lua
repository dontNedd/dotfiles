local o = vim.opt

-- hl yank
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- line nums
o.number = true
o.relativenumber = true

-- indentation
o.tabstop = 4
o.shiftwidth = 4
o.autoindent = true
o.expandtab = true

-- search settings
o.ignorecase = true
o.smartcase = true

-- appearance
o.signcolumn = "yes"
o.cursorline = true

-- clipboard
o.clipboard:append("unnamedplus")

-- split windows
o.splitbelow = true
o.splitright = true

-- dw/diw/ciw works on full-word
o.iskeyword:append("-")

-- x rows from top/bottom
o.scrolloff = 8

-- undo dir settings
o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

-- incremental search
o.incsearch = true

-- faster cursor hold
o.updatetime = 50
