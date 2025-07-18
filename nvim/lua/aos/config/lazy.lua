-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{ import = "aos.plugins" },
	},
	-- automatically check for plugin updates
	checker = { enabled = false },
})

-- TODO: make shift+ctrl+d grab neovim path to open term at current file location.
--
-- -- Automatically write the current file's directory to /tmp/current_directory.txt
-- -- for ghostty
-- vim.api.nvim_create_autocmd({"BufEnter", "BufRead", "BufNewFile"}, {
--   callback = function()
--     local dir = vim.fn.expand('%:p:h')
--     vim.fn.system('echo -n ' .. dir .. ' > /tmp/current_directory.txt')
--   end,
-- })
