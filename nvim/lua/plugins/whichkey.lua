return {
    {
        "folke/which-key.nvim",
        event = "VimEnter",
        opts = {
            delay = 0,
        },
        spec = {
            { "<leader>s", group = "[S]earch" },
            { "<leader>t", group = "[T]oggle" },
        },
    },
}
