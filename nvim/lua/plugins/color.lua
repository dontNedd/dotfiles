return {
    {
        -- color
        'sainnhe/gruvbox-material',
        priority = 1000,
        config = function ()
            vim.g.gruvbox_material_background = 'hard'
            vim.g.gruvbox_material_enable_italic = 0
            vim.cmd.colorscheme ('gruvbox-material')
        end,
    },
}
