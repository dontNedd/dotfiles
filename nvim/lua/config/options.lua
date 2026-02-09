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
o.expandtab = true -- tabs == spaces
o.wrap = true      -- display a wrapped line

o.listchars = {
    tab = "┊ ",
    trail = "·",
    extends = "»",
    precedes = "«",
    nbsp = "×",
}

-- search settings
o.ignorecase = true
o.smartcase = true

-- appearance
o.signcolumn = "yes"
o.cursorline = true
o.showmode = false
o.termguicolors = true

-- autocomplete
o.completeopt = { "menu", "menuone", "noselect" }
o.shortmess = o.shortmess + {
    c = true,
}

-- Hide cmd line
o.cmdheight = 0 -- more space in the neovim command line for displaying messages

-- clipboard
o.clipboard:append("unnamedplus")

-- split windows
o.splitbelow = true
o.splitright = true

-- dw/diw/ciw works on full-word
o.iskeyword:append("-")

-- x rows from top/bottom
o.scrolloff = 8
o.sidescrolloff = 3

-- undo dir settings
o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

-- incremental search
o.incsearch = true

-- faster cursor hold
o.updatetime = 50
o.history = 100
o.redrawtime = 1500
o.timeoutlen = 250

-- Enable virtual_lines feature if the current nvim version is 0.11+
if vim.fn.has("nvim-0.11") > 0 then
    vim.diagnostic.config({
        -- Use the default configuration
        -- virtual_lines = true,

        -- Alternatively, customize specific options
        virtual_lines = {
            -- Only show virtual line diagnostics for the current cursor line
            current_line = true,
        },
    })
end
