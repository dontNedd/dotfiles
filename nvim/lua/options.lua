-------- Options --------
local o = vim.opt

-------- Editing/Indentation --------
o.number = true -- Show line numbers
o.relativenumber = false -- Show relative line numbers
o.tabstop = 4 -- Width of a tab character
o.shiftwidth = 4 -- indentation width
o.softtabstop = 4 -- How tab behaves while editing
o.expandtab = true -- insert spaces instead of tabs
o.smartindent = true -- Basic automatic indentation
o.autoindent = true -- Copy indentation from previous line
o.wrap = false -- Visually wrap long lines
o.breakindent = true -- Keep indentation when wrapped

-------- Search --------
o.ignorecase = true -- Case-insensitive searching 
o.smartcase = true -- Searching becomes case-sensitive if you use uppercase
o.hlsearch = true -- Highlight search matches
o.incsearch = true -- Show matches while typing a search

-------- UI --------
o.cursorline = true -- Highlight the current line
o.signcolumn = "yes" -- Always reserve space for diagnostics/signs
o.termguicolors = true -- Enable 24-bit terminal colors
o.showmode = false -- Hide mode eg. -- INSAERT --, etc.
o.laststatus = 3 -- one statusline across the entire editor
o.scrolloff = 10 -- Keep space above/below cursor
o.sidescrolloff = 10 -- Keep space beside cursor
o.cmdheight = 1 -- Command-line height

-------- Split --------
o.splitbelow = true -- Horizontal splits open below
o.splitright = true -- Vertical splits open right

-------- Files/Undo --------
o.undofile = true -- Persist undo history between sessions
o.swapfile = false -- Disable swap files
o.backup = false -- Don't create backup files
o.writebackup = false -- Don't create backup before writing
o.autoread = true -- Automatically notice externally changed files

-------- Completion/Editing --------
o.completeopt = "menuone,noselect" -- Controls completion popup behavior
o.virtualedit = "block" -- Allows cursor beyond text in visual block mode
o.clipboard = "unnamedplus" -- Use system clipboard
o.mouse = "a" -- Enable mouse support
o.pumheight = 8 -- Auto complete show options

-------- Performance --------
o.updatetime = 250 -- Time before some events trigger
o.timeoutlen = 300 -- How long Neovim waits for key sequences
o.redrawtime = 10000 -- Maximum time spent redrawing

-------- HL Yank --------
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

