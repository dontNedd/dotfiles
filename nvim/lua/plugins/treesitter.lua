-------- Treesitter --------

return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",

        config = function()
            require("nvim-treesitter").setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
            })

            require("nvim-treesitter").install({
                "c",
                "cpp",
                "lua",
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "c", "cpp", "lua" },
                callback = function()
                    vim.treesitter.start()
                end,
            })
        end,
    },
}
