local o = vim.opt
local g = vim.g

-- set local leader
g.mapleader = " "
g.maplocalleader = " "

-- Yank hl
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', {clear = true}),
    callback = function() vim.hl.on_yank() end,
})

-- clipboard
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- default options
o.number 	    = true 		-- line numbers
o.mouse 	    = 'a' 		-- enable mouse 
o.showmode 	    = false 	-- dont show mode 
o.breakindent 	= true 		-- enable break indent
o.undofile 	    = true 		-- enable undo/redo after close of file
o.signcolumn 	= 'yes' 	-- add left indent
o.updatetime 	= 250 		-- update time
o.timeoutlen 	= 300		-- decrease mapped key time
o.inccommand	= 'split'	-- preview substitutions live
o.cursorline 	= true 		-- enable line cursor 
o.scrolloff	    = 10 		-- minimal number of screen lines to keep above and below the cursor
o.confirm 	    = true		-- skip "are you sure commands"

-- indentation
local indent 	= 4
o.autoindent 	= true 		-- uses indent from previous line
o.expandtab 	= true		-- spaces will be used to fill whitespace
o.shiftround 	= true
o.shiftwidth 	= indent
o.smartindent 	= true 		-- like 'autoindent', recognizes some C syntax
o.softtabstop 	= indent 	-- 
o.tabstop 	    = indent

-- search lint
o.hlsearch 	    = true
o.ignorecase 	= true
o.smartcase 	= true

-- UI
o.cmdheight 	= 0
o.completeopt 	= ({"menu", "menuone", "noselect"})
o.winborder 	= "rounded"
o.winminwidth 	= 5
o.wrap 		    = true
