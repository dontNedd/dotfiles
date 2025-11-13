-- -- call local function if color scheme doesnt have native opacity
-- local function enable_transparency()
--     vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--     vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
-- end

return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require('kanagawa').setup({
                theme = "wave",
                transparent = true,
                terminalColors = true,
            })
            vim.cmd.colorscheme("kanagawa-wave")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            theme = "kanagawa-wave",
        }
    },
}
