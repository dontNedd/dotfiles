return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            require("telescope").setup({})
            vim.keymap.set("n", "<space>sf", require("telescope.builtin").find_files, { desc = "[S]earch files" })
            vim.keymap.set("n", "<space>sn", function()
                require("telescope.builtin").find_files({
                    cwd = vim.fn.stdpath("config"),
                })
            end, { desc = "[S]earch nvim files" })
        end,
    },
}
