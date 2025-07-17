return {
	{
		'rebelot/kanagawa.nvim',
		priority = 1000, -- Make sure to load this before all the other start plugins.
		config = function()
			require('kanagawa').setup {
				styles = {
					comments = { italic = false }, -- Disable italics in comments
				},
			}

			-- Load the colorscheme here.
			vim.cmd.colorscheme 'kanagawa-wave'
		end,
	},
}
