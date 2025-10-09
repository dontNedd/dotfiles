return {
    {
        "rose-pine/neovim",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("rose-pine")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "rose-pine",
                },
            })
        end,
    },
}
