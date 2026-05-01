-- This needs a term that allows
-- 24-bit RGB
-- just for color accuracy
vim.opt.termguicolors = true

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data").. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Load order
-- options and mapping must load before plugins (leader key, etc.)
-- for _, mod in ipairs({"options", "mapping", "autocmds", "plugins" }) do
-- only .lua files
for _, mod in ipairs({"options", "keymaps" }) do
	local ok, err = pcall(require, mod)
	if not ok then
		vim.api.nvim_echo({
            {"Failed to load ", "ErrorMsg"},
            { tostring(mod), "WarningMsg" },
            {"\n\n" .. tostring(err), "Comment"},
        }, false, {})
	end
end

-- Add plugins here and disable them if you dont.
require('lazy').setup({
    require 'plugins.lualsp',
    require 'plugins.blink-cmp',
    require 'plugins.treesitter',
    require 'plugins.neo-tree',
    require 'plugins.color',
})
