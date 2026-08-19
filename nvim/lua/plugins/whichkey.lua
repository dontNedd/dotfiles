-------- Which Key --------

return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},

		config = function()
			require('which-key').add({
				{'<leader>d', group = 'Debug'},
				{'<leader>f', group = 'Files'},
				{'<leader>l', group = 'LSP'},
			})
		end,
	},
}
